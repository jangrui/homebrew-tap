cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.4.0"

  on_arm do
    sha256 "7a748829dbdd2b576c4acdc9bf8c8536431e9b38d0fa624f32f75ccd47cc9cde"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.4.0/macos-arm64/ZCode-3.4.0-mac-arm64.dmg"
  end
  on_intel do
    sha256 "a83c33de1088c0b89b00f369a9733c13ac22d84d54bc34618d18b02e3091a9f7"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.4.0/macos-x64/ZCode-3.4.0-mac-x64.dmg"
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
