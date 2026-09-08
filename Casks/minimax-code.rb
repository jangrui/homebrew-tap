cask "minimax-code" do
  version "3.0.69"
  sha256 "17601064fc7ecd31ee11af65b0cbfdf6921cad05596ddb2fd59041364b30fe33"

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
