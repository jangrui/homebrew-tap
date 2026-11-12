cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.18.1"
  sha256 arm:   "203a1a6ffbb21f47bfc1b0a85d1a1b6c950f139c90c0aa27a3b18556236f18d7",
         intel: "5762629e72d35428f23c63f65e6c4ad2fb6a2149f67a7cc9d6e8aad157f7d062"

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
