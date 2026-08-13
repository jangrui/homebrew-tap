cask "omniroute-app" do
  version "3.8.49"

  on_arm do
    sha256 "5599543afa719170a9db0c5aefeafaa81ca40e6e2a976ecc85f17dacdf8a1655"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "3ffb44eeed7ae41dcd93a678f25144267e67bfcda85117cb21c279977528364c"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}.dmg"
  end

  name "OmniRoute"
  desc "OmniRoute 桌面端,统一 AI 网关(Electron),聚合 160+ 提供商的浏览器仪表盘"
  homepage "https://github.com/diegosouzapw/OmniRoute"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "OmniRoute.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/OmniRoute.app"]
  end

  zap trash: [
    "~/Library/Application Support/OmniRoute",
    "~/Library/Application Support/online.omniroute.desktop",
    "~/Library/Caches/online.omniroute.desktop",
    "~/Library/HTTPStorages/online.omniroute.desktop",
    "~/Library/Logs/OmniRoute",
    "~/Library/Preferences/online.omniroute.desktop.plist",
    "~/Library/Saved Application State/online.omniroute.desktop.savedState",
    "~/Library/WebKit/online.omniroute.desktop",
  ]
end
