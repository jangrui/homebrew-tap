cask "deepseek-harness-desktop" do
  version "0.1.0"
  sha256 "65d6f3ae1f0f51ae2edc00ff82862a9bc88f383d6639bbf1bfb5973a47f5d286"

  url "https://github.com/anywhere-labs/deepseek-harness-desktop/releases/download/v#{version}/DeepSeek-Harness-#{version}-arm64.dmg"
  name "DeepSeek Harness Desktop"
  desc "为 DeepSeek Harness 生态打造的桌面端客户端,开箱即用启动并管理本地 Harness 服务"
  homepage "https://dshdesktop.cn/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "DeepSeek Harness.app"

  zap trash: [
    "~/Library/Application Support/@deepseek-ai/dsh-desktop",
    "~/Library/Caches/ai.deepseek.harness.desktop",
    "~/Library/Caches/ai.deepseek.harness.desktop.ShipIt",
    "~/Library/HTTPStorages/ai.deepseek.harness.desktop",
    "~/Library/Preferences/ai.deepseek.harness.desktop.plist",
    "~/Library/Saved Application State/ai.deepseek.harness.desktop.savedState",
  ]
end
