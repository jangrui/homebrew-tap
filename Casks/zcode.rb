cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.6.4"

  on_arm do
    sha256 "0ca14145c55b89f8320597dd1fea4edb2f0d090a40051d2edc636ee577a0fa2d"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.4/macos-arm64/ZCode-3.6.4-mac-arm64.dmg"
  end
  on_intel do
    sha256 "146eb1cae603381b82bc06b5045f8688d22ab84b2f5ae41c83c621d97d01de07"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.4/macos-x64/ZCode-3.6.4-mac-x64.dmg"
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
