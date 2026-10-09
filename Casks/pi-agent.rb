cask "pi-agent" do
  version "0.6.0"
  sha256 "8bae2985456a6ed37883551b7c61a2fe76f06528ce428a7a6a21480ef59b4246"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/Pi Agent.app"]
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
