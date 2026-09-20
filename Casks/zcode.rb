cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.14.1"
  sha256 arm:   "f2ae7aba49681a65745657f9d95ddd8fd9dfa2db3e6e3bae91b3fecec68a99b6",
         intel: "f65b6b6e97a4098bf214460bb05a5fc00107c678e8b9ee40b746fe9923001219"

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
