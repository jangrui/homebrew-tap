cask "easycliproxyapi" do
  arch arm: "aarch64", intel: "amd64"

  version "0.3.51"
  sha256 arm:   "dc108d4b0868cef6a79047195f6a23b674b68605a43a1356afd9de4e54528257",
         intel: "e0c6b505aae775bd33a17217377a3c879a47337061f75d97a9ada3098ad9ec96"

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
