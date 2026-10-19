cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.16.2"
  sha256 arm:   "69d836ed653d4a57de3315e26e0683dfeb3e8b8e0a610a1c5b6063ac81643714",
         intel: "f192ca3f9a1395b49afbd5d78f034e43651e7e4545e725c873285d9223a54ff6"

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
