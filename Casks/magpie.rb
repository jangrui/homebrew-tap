cask "magpie" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1786"
  sha256 arm:   "ab37914a9458e93fd9ec2b278bbee4d0f2dff2e586d7110c151ce3f80c1b7c9a",
         intel: "d210f84c0db0a12e4c7b0fd5b97070c71d7627528a3ab3cc59ac87b9f05b5e07"

  url "https://github.com/yetone/magpie-releases/releases/download/v#{version}/magpie-darwin-#{arch}.dmg"
  name "Magpie"
  desc "本地 AI 网关与路由器,让 Claude Code/Codex 等 Agent 用任意模型供应商,支持订阅共享与故障转移"
  homepage "https://usemagpie.ai/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "magpie.app"

  zap trash: [
    "~/.cache/magpie",
    "~/.config/magpie",
    "~/Library/Caches/com.yetone.magpie",
    "~/Library/LaunchAgents/com.yetone.magpie.serve.plist",
    "~/Library/Logs/magpie",
    "~/Library/Saved Application State/com.yetone.magpie.savedState",
    "~/Library/WebKit/com.yetone.magpie",
  ]
end
