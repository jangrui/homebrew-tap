cask "magpie" do
  version "0.1.1279"

  on_arm do
    sha256 "633adcd9072afa1a0bc2e2f84202aa602a82daa9c57f079fee813ad8544cc3cc"

    url "https://github.com/yetone/magpie-releases/releases/download/v#{version}/magpie-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "49abbf11dbfed247c23ff44706333336036b94e493d72fbb3a270c53441c9fa8"

    url "https://github.com/yetone/magpie-releases/releases/download/v#{version}/magpie-darwin-amd64.dmg"
  end

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
