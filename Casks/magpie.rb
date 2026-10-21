cask "magpie" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1318"
  sha256 arm:   "13f4f22394e539fe6db7b219833e84776c693f8400ec239813928d31824d1b9b",
         intel: "f1355d139da333faffd15dcb7f9365afd6c7ace4ec24f8258f1090f9fe208f7a"

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
