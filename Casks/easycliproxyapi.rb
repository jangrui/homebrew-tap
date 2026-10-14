cask "easycliproxyapi" do
  version "0.3.38"

  on_arm do
    sha256 "069b2f3822ffa33171f11f40bbf77f7ca7163ceee33985d5f9602f0fe3a7042c"

    url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-aarch64.dmg"
  end
  on_intel do
    sha256 "1056686d7bd2cf5cce195f55209c248023979188687d773e8ce972608ef8c848"

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
