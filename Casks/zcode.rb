cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.14.3"
  sha256 arm:   "32ef4120c8823bd6f793a1491669c62ca66d04c7a706ebbc736071a75a1d6802",
         intel: "475a6dc3d43b0b158d631b397a3101717f5ecb9f4e9ea8a3a8b9fc8407de4ef4"

  url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/macos-#{arch}/ZCode-#{version}-mac-#{arch}.dmg"
  name "ZCode"
  desc "Z.ai 的 Agentic Development Environment,内置 GLM coding agent"
  homepage "https://zcode.z.ai/"

  livecheck do
    url "https://zcode.z.ai/api/v1/releases/electron/manifest?platform=darwin-aarch64&channel=3"
    strategy :page_match
    regex(/^version:\s*v?(\d+(?:\.\d+)+)\s*$/i)
  end

  auto_updates true
  depends_on macos: :monterey

  app "ZCode.app"

  uninstall quit: "dev.zcode.app"

  zap trash: [
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/dev.zcode.app.sfl*",
        "~/Library/Application Support/ZCode",
        "~/Library/Caches/@zcodedesktop-updater",
        "~/Library/Caches/dev.zcode.app",
        "~/Library/Caches/dev.zcode.app.ShipIt",
        "~/Library/HTTPStorages/dev.zcode.app",
        "~/Library/Preferences/dev.zcode.app.plist",
        "~/Library/Services/Open in ZCode.workflow",
      ],
      rmdir: "~/.zcode"
end
