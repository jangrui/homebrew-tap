cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.9.1"

  on_arm do
    sha256 "611da2313a6e1de6011898e21c87f57df6c7745d27674f0840373f70f957fe2f"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.9.1/macos-arm64/ZCode-3.9.1-mac-arm64.dmg"
  end
  on_intel do
    sha256 "1cc70bbba1962559840f8d96d9b74d5fe9dacb10f27f743b9fa46d61aeb08f9b"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.9.1/macos-x64/ZCode-3.9.1-mac-x64.dmg"
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
