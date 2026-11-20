cask "minimax-code" do
  version "3.1.17"
  sha256 "fb5cd33220868b2c631d26cbf4f82648fa1f937666f18fc8a0647c6061005497"

  url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/MiniMax%20Code-#{version}-arm64.dmg"
  name "MiniMax Code"
  desc "MiniMax Agent 桌面端,多 Agent 协作 + 工作区文件批量处理 + 浏览器自动化"
  homepage "https://agent.minimaxi.com/"

  livecheck do
    url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "MiniMax Code.app"

  uninstall quit: "com.minimax.agent.cn"

  zap trash: [
    "~/Library/Application Support/MiniMax",
    "~/Library/Caches/@mmx-agentelectron-updater",
    "~/Library/Caches/com.minimax.agent.cn.ShipIt",
    "~/Library/HTTPStorages/com.minimax.agent.cn",
    "~/Library/Preferences/com.minimax.agent.cn.plist",
  ]
end
