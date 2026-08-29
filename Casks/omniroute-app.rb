cask "omniroute-app" do
  version "3.8.50"

  on_arm do
    sha256 "2babe5e5cd983ea290fa816189cf7ca49fad230c59f6f790b99683e454305d4b"

    url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "db4897bf300bda63dc8613097bd0fdb69e38dc925751bf18c951e1190eb4f02f"

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
