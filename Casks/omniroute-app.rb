cask "omniroute-app" do
  version "3.8.51"

  on_arm do
    sha256 "b539afe6359e6fcb772cd3b735e4671ac2818524a7a525251bc8eb64d043c4a9"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "15484ce1f055f9faede5d53994db718ed0ed7712ac9d84c5e3c55df5e580fe36"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/OmniRoute.app"]
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
