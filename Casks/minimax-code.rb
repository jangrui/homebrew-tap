cask "minimax-code" do
  version "3.0.54"
  sha256 "55b11231dc7329048729373a0fdd3783f7ce625c13f58b5b4fa1d20d40eb79f6"

  url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/MiniMax%20Code-3.0.54-arm64.dmg",
      verified: "filecdn.minimax.chat/public/minimax-agent-prod/"
  name "MiniMax Code"
  desc "MiniMax Agent 桌面端,多 Agent 协作 + 工作区文件批量处理 + 浏览器自动化"
  homepage "https://agent.minimaxi.com/"

  livecheck do
    url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "MiniMax Code.app"

  zap trash: [
    "~/Library/Application Support/MiniMax",
    "~/Library/Caches/@mmx-agentelectron-updater",
    "~/Library/Caches/com.minimax.agent.cn.ShipIt",
    "~/Library/HTTPStorages/com.minimax.agent.cn",
    "~/Library/Preferences/com.minimax.agent.cn.plist",
  ]
end
