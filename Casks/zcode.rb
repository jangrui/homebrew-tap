cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.7.7"

  on_arm do
    sha256 "2a11e600a0eaaeee72b926f22925f91128dd57bdf87f685f934749a4da94ee07"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.7/macos-arm64/ZCode-3.7.7-mac-arm64.dmg"
  end
  on_intel do
    sha256 "8abf42694fa96c6a349a46f8d26f523ae08826d4fd3a070a401ae65a5a76daab"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.7/macos-x64/ZCode-3.7.7-mac-x64.dmg"
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
