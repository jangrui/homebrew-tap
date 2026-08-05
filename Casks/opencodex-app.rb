cask "opencodex-app" do
  version "1.1.1"
  sha256 "1985eb40414e9e8376b8e85dd46498a49007b83eca67b047246b0284c112064a"

  url "https://github.com/AITabby/opencodex/releases/download/v#{version}/OpenCodex-#{version}-arm64.dmg"
  name "OpenCodex"
  desc "Codex Desktop 本地 AI 工作台,网关、语音、会话管理、第三方模型与 Agent 工具,仅 arm64"
  homepage "https://github.com/AITabby/opencodex"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OpenCodex.app"

  zap trash: [
    "~/Library/Application Support/OpenCodex",
    "~/Library/Caches/com.aitabby.opencodex",
    "~/Library/HTTPStorages/com.aitabby.opencodex",
    "~/Library/Preferences/com.aitabby.opencodex.plist",
    "~/Library/Saved Application State/com.aitabby.opencodex.savedState",
  ]
end
