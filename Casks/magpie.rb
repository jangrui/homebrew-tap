cask "magpie" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.3961"
  sha256 arm:   "5c9dc7dbc3a204cdbb222cfb1cecadb97a768cb20e23a6280053dc6b02a3d0a3",
         intel: "abda875e2905a49f4e682b7963e908afe1c2072b9b4571ef48e997483f334f07"

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
