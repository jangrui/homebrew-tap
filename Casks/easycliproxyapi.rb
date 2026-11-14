cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.106"
  sha256 arm:   "4c345f58dcf0c62f1830c2d683fd347117be930369be06b71ab99fe7f44235fd",
         intel: "ecb6f71b92aeb1a79d77f2de55b405fcca69778858f5009bd94fcbaba858d891"

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
