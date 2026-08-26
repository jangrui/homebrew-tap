cask "deepseek-harness-desktop" do
  version "2.0.3"
  sha256 "9a5d4a51689baa7c24be7f11903f0ba9cfe4885a3241e573a1cc4134cd500329"

  url "https://github.com/anywhere-labs/deepseek-harness-desktop/releases/download/v#{version}/DSH.Desktop-#{version}-universal.dmg"
  name "DSH Desktop"
  desc "为 DeepSeek Harness 生态打造的桌面端客户端,开箱即用启动并管理本地 Harness 服务"
  homepage "https://dshdesktop.cn/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "DSH Desktop.app"

  uninstall quit: "ai.deepseek.dsh.desktop"

  zap trash: [
    "~/Library/Application Support/@deepseek-ai/dsh-desktop",
    "~/Library/Application Support/ai.deepseek.dsh.desktop",
    "~/Library/Caches/ai.deepseek.dsh.desktop",
    "~/Library/Caches/ai.deepseek.dsh.desktop.ShipIt",
    "~/Library/Caches/ai.deepseek.harness.desktop",
    "~/Library/Caches/ai.deepseek.harness.desktop.ShipIt",
    "~/Library/HTTPStorages/ai.deepseek.dsh.desktop",
    "~/Library/HTTPStorages/ai.deepseek.harness.desktop",
    "~/Library/Preferences/ai.deepseek.dsh.desktop.plist",
    "~/Library/Preferences/ai.deepseek.harness.desktop.plist",
    "~/Library/Saved Application State/ai.deepseek.dsh.desktop.savedState",
    "~/Library/Saved Application State/ai.deepseek.harness.desktop.savedState",
  ]
end
