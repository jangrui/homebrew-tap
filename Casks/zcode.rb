cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.14.5"
  sha256 arm:   "7e46b70165fe83fe2df6e5154da1982b50660ff4ff250cdb4b778e4f25c97d94",
         intel: "887e6f38254678089105019776608d6d7843495b9be5cb55c280e8054d544287"

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
