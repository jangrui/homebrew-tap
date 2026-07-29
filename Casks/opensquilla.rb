cask "opensquilla" do
  version "0.5.2"
  sha256 "ef2cb137d956c327e45a85b953c783564758f1a8f00c93edb64c5504587d882a"

  url "https://github.com/opensquilla/opensquilla/releases/download/v#{version}/OpenSquilla-#{version}-mac-arm64.dmg"
  name "OpenSquilla"
  desc "Token 高效的本地 AI Agent,SquillaRouter 模型路由 + 多工具 + 本地记忆 + 安全沙箱"
  homepage "https://opensquilla.ai/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "OpenSquilla.app"

  zap trash: [
    "~/Library/Application Support/OpenSquilla",
    "~/Library/Caches/ai.opensquilla.desktop",
    "~/Library/Caches/ai.opensquilla.desktop.ShipIt",
    "~/Library/HTTPStorages/ai.opensquilla.desktop",
    "~/Library/Logs/OpenSquilla",
    "~/Library/Preferences/ai.opensquilla.desktop.plist",
    "~/Library/Saved Application State/ai.opensquilla.desktop.savedState",
  ]
end
