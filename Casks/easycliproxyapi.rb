cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.41"
  sha256 arm:   "11bfcdd3c0f788b9f8710675e88cadb847bccbb6eec4c2b874ffd2a1aaf3eb3e",
         intel: "99dd19ed5d3dd9b06fb2cc141692b263fdfab9687c2cced1f4ebf2775b9f5781"

  url "https://github.com/router-for-me/EasyCLIProxyAPI/releases/download/v#{version}/EasyCLIProxyAPI-v#{version}-Darwin-#{arch}.dmg"
  name "EasyCLIProxyAPI"
  desc "CLIProxyAPI 桌面端,自动配置主流 AI Agent(Claude/Codex 等)的 API 代理网关 GUI"
  homepage "https://github.com/router-for-me/EasyCLIProxyAPI"

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
