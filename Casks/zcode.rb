cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.5.3"

  on_arm do
    sha256 "0681ec23a20f0b6c36001766985d09deba4039cd60fd033784360ba129d9f4e1"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.5.3/macos-arm64/ZCode-3.5.3-mac-arm64.dmg"
  end
  on_intel do
    sha256 "729436eaeedeb913fe87aebca5b631ce19090d3d26ee53bab08d37403190924d"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.5.3/macos-x64/ZCode-3.5.3-mac-x64.dmg"
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
