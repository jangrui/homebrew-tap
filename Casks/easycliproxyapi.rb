cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.74"
  sha256 arm:   "8782c0009ab8442b47e55f4c24517dacd4880cedf1cea0721c0ab944dc673b05",
         intel: "276de46d1e464608eb24a566744a377b20d29203360151694b9b64843a7b4398"

  url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-#{arch}.dmg"
  name "EasyCLIProxyAPI"
  desc "CLIProxyAPI 桌面端,自动配置主流 AI Agent(Claude/Codex 等)的 API 代理网关 GUI"
  homepage "https://github.com/router-for-me/EasyCLIProxyAPI/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

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
