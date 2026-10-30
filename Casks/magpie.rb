cask "magpie" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.2164"
  sha256 arm:   "1cfbcf083e768cb7ef9cd7b6b731375ef0583b64a9e860514a962a0cb0a3259b",
         intel: "fcc62f19d3b8f864ab9b5883e147474cf1cfa917557b4ca7fb526f4700be3fee"

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
