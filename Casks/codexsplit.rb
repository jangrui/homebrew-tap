cask "codexsplit" do
  version "2.0.1"
  sha256 "d2105f2dd67881c200cf8e058a11729934b56db21ce062adc49fa358267e88ee"

  url "https://github.com/AITabby/opencodex/releases/download/v#{version}/CodexSplit-#{version}-arm64.dmg"
  name "CodexSplit"
  desc "Codex Desktop 本地 AI 工作台,网关、语音、会话管理、第三方模型与 Agent 工具,仅 arm64"
  homepage "https://github.com/AITabby/opencodex"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "CodexSplit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/CodexSplit.app"]
  end

  zap trash: [
    "~/Library/Application Support/CodexSplit",
    "~/Library/Caches/com.aitabby.codexsplit",
    "~/Library/HTTPStorages/com.aitabby.codexsplit",
    "~/Library/Preferences/com.aitabby.codexsplit.plist",
    "~/Library/Saved Application State/com.aitabby.codexsplit.savedState",
  ]
end
