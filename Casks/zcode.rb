cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.7.5"

  on_arm do
    sha256 "5f455df104e73d2197c88caf579ab7d84b46b0d3b94d099ed2236e2a926edd23"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.5/macos-arm64/ZCode-3.7.5-mac-arm64.dmg"
  end
  on_intel do
    sha256 "82464156e7e2cbd107f1bf06ad136d954b4d545062003da15c90099fdbd160a8"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.5/macos-x64/ZCode-3.7.5-mac-x64.dmg"
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
