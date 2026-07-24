cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.5.2"

  on_arm do
    sha256 "8c66225df62187305cbc0d90c211c98e09fed882ddffc3e6cb429d632fb34ad9"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.5.2/macos-arm64/ZCode-3.5.2-mac-arm64.dmg"
  end
  on_intel do
    sha256 "df84843cab62249e34579bd053e7fd32183a25cb0e168419262606527943514b"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.5.2/macos-x64/ZCode-3.5.2-mac-x64.dmg"
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
