cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.7.6"

  on_arm do
    sha256 "9c8f6a180ddb64a6863a3102412e9ee29ab183f1aeec1ff78ed2c8d3ea800b4d"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.6/macos-arm64/ZCode-3.7.6-mac-arm64.dmg"
  end
  on_intel do
    sha256 "a81ca077c88d33c8931837c70904a107640fd9bd6be72546264c45268d1f040e"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.6/macos-x64/ZCode-3.7.6-mac-x64.dmg"
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
