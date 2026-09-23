cask "easycliproxyapi" do
  version "0.3.2"

  on_arm do
    sha256 "dad5d32a72f62a32252cf5b9340e18292fc6eb399d1cd01a1671fc735683d86f"

    url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-aarch64.dmg"
  end
  on_intel do
    sha256 "496c6b0983a7e392d21b521d6436f519fd4b24069446a06b6519067328c008ee"

    url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-amd64.dmg"
  end

  name "EasyCLIProxyAPI"
  desc "CLIProxyAPI 桌面端,自动配置主流 AI Agent(Claude/Codex 等)的 API 代理网关 GUI"
  homepage "https://github.com/router-for-me/EasyCLIProxyAPI"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :big_sur

  app "EasyCLIProxyAPI.app"

  zap trash: [
    "~/Library/Application Support/com.cpa.gui",
    "~/Library/Caches/com.cpa.gui",
    "~/Library/HTTPStorages/com.cpa.gui",
    "~/Library/Logs/com.cpa.gui",
    "~/Library/Preferences/com.cpa.gui.plist",
    "~/Library/Saved Application State/com.cpa.gui.savedState",
    "~/Library/WebKit/com.cpa.gui",
  ]
end
