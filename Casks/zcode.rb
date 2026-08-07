cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.7.3"

  on_arm do
    sha256 "c93dbd329900ec77357531b5a6129056e183c26ed0daa7aaa2079b84284e354d"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.3/macos-arm64/ZCode-3.7.3-mac-arm64.dmg"
  end
  on_intel do
    sha256 "1640f2abd96b984bda9e268ab52022146dd568208125cbf855037e81e443d19f"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.7.3/macos-x64/ZCode-3.7.3-mac-x64.dmg"
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
