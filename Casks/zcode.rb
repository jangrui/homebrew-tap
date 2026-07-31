cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.6.5"

  on_arm do
    sha256 "e4f93eb3fa51825fc3a443b3307dc52eda98c018d9ac326a22d254f8aa77ac8b"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.5/macos-arm64/ZCode-3.6.5-mac-arm64.dmg"
  end
  on_intel do
    sha256 "8f496426828411940a03e757f9a9f56ee684f9b59274351f7f7b96e4c55c4df8"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.5/macos-x64/ZCode-3.6.5-mac-x64.dmg"
  end

  name "ZCode"
  desc "Z.ai 的 Agentic Development Environment,内置 GLM-5.2 coding agent"
  homepage "https://zcode.z.ai/"

  livecheck do
    url "https://zcode.z.ai/api/v1/releases/electron/manifest?platform=darwin-aarch64&channel=3"
    strategy :page_match
    regex(/^version:\s*v?(\d+(?:\.\d+)+)\s*$/i)
  end

  depends_on macos: :monterey

  app "ZCode.app"

  zap trash: [
    "~/Library/Application Support/ZCode",
    "~/Library/Caches/@zcodedesktop-updater",
    "~/Library/Caches/dev.zcode.app",
    "~/Library/Caches/dev.zcode.app.ShipIt",
    "~/Library/HTTPStorages/dev.zcode.app",
    "~/Library/Preferences/dev.zcode.app.plist",
  ]
end
