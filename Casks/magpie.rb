cask "magpie" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4623"
  sha256 arm:   "07cf3ca48827823296fb09767158b6c93b13b5eb474cc24114e849508b12197b",
         intel: "27828f4d809accd0f061c0ee4fb648e6bb583b5a231cff246780af4d8d35687b"

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
