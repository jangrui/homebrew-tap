cask "pi-agent" do
  version "0.3.0"
  sha256 "ae0bff89a9a17fff8715bc0cf9c4015f656ad63ffc6a5c68963db3422d182aa1"

  url "https://github.com/abcwyc/pi-agent-desktop/releases/download/v#{version}/Pi.Agent_#{version}_aarch64.dmg"
  name "Pi Agent"
  desc "跨平台 AI 编码 Agent 桌面客户端,免环境配置、免终端命令,开箱即用"
  homepage "https://github.com/abcwyc/pi-agent-desktop"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Pi Agent.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Pi Agent.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.abcwyc.pi-agent",
    "~/Library/Caches/com.abcwyc.pi-agent",
    "~/Library/HTTPStorages/com.abcwyc.pi-agent",
    "~/Library/Logs/com.abcwyc.pi-agent",
    "~/Library/Preferences/com.abcwyc.pi-agent.plist",
    "~/Library/Saved Application State/com.abcwyc.pi-agent.savedState",
    "~/Library/WebKit/com.abcwyc.pi-agent",
  ]
end
