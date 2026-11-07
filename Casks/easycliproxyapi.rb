cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.89"
  sha256 arm:   "e34eedfcab39453c3c9c3d8f44efb44455178b72a2b390323025406cc910df62",
         intel: "35225baaeb41a3ce03cf047a6c10c52bcbc30c6b489bec862d3f571da8e0f1ab"

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
