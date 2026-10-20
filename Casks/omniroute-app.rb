cask "omniroute-app" do
  version "3.8.52"

  on_arm do
    sha256 "d56ca0fc0422fefaf85313d0ec1c14d79412a5480d93debe56468bb2947fd81b"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "354f12c1f268bd9f309acbe1d49ebf5929be19e060e74b975d36304d8699dd5c"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}.dmg"
  end

  name "OmniRoute"
  desc "OmniRoute 桌面端,统一 AI 网关(Electron),聚合 160+ 提供商的浏览器仪表盘"
  homepage "https://www.omniroute.online/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "OmniRoute.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rsd", "com.apple.quarantine", "{{appdir}}/OmniRoute.app"]
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
