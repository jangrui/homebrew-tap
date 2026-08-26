cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.9.2"

  on_arm do
    sha256 "f23269a9ed81d56dc54015bac5c3025d15d7927d73085c81f9d697f40968d0a4"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.9.2/macos-arm64/ZCode-3.9.2-mac-arm64.dmg"
  end
  on_intel do
    sha256 "3270abb9ac650f52727a7d0bde8b05204f0a7224e21c4fa2099ec116e7ac862d"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/3.9.2/macos-x64/ZCode-3.9.2-mac-x64.dmg"
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
