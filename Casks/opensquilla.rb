cask "opensquilla" do
  version "0.5.0"
  sha256 "691425dbd8d8bbbac8c781d9ac42c8127f253bf4a0e4f1e08cf27d6a41777f50"

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
