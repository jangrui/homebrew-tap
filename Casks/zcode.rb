cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.6.2"

  on_arm do
    sha256 "360dc467c89dd64ad38be8c657b871abe54809f4017e3153d30040d53c23b240"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.2/macos-arm64/ZCode-3.6.2-mac-arm64.dmg"
  end
  on_intel do
    sha256 "4d2ef42b63caf738d44c272c9266e43ea3c2d4f81224a31dfd89a6a40f30620f"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.6.2/macos-x64/ZCode-3.6.2-mac-x64.dmg"
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
