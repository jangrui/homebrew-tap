cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.4.2"

  on_arm do
    sha256 "958f463113ee8686410306c93c0cee740a8f85afb05321eb4873b628d20a3021"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.4.2/macos-arm64/ZCode-3.4.2-mac-arm64.dmg"
  end
  on_intel do
    sha256 "ceaf13c207735f12909fca89a1a30f5cacd5a0fa0013d50b15f9f390b0419689"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.4.2/macos-x64/ZCode-3.4.2-mac-x64.dmg"
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
