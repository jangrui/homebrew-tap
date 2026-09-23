cask "opensquilla" do
  version "0.5.5"
  sha256 "95204d777cf9ca527f5f46dc3a73914dc50b269676c146dabf456adf23a9109b"

  url "https://github.com/opensquilla/opensquilla/releases/download/v#{version}/OpenSquilla-#{version}-mac-arm64.dmg"
  name "OpenSquilla"
  desc "Token 高效的本地 AI Agent,SquillaRouter 模型路由 + 多工具 + 本地记忆 + 安全沙箱"
  homepage "https://opensquilla.ai/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "OpenSquilla.app"

  uninstall quit: "ai.opensquilla.desktop"

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
