cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.8.1"

  on_arm do
    sha256 "30cea85267ada685c283f996d428cee947551d3373363d9e659105d76cf1b815"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.8.1/macos-arm64/ZCode-3.8.1-mac-arm64.dmg"
  end
  on_intel do
    sha256 "f22c947aa51a0fe7a27668d4c3db6b8a01b9bd40e77cd44c63332747d92ee273"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.8.1/macos-x64/ZCode-3.8.1-mac-x64.dmg"
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
