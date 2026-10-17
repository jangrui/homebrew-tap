cask "openchatcut" do
  version "0.2.17"

  on_arm do
    sha256 "ffd89646dc7a8c60cc799178a13130d3b02feb6d9ed3de7749b23fe48ff39802"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "38aa1103a4b8c4b150bd354f892b9db0b8330cad7d26b6a4e75928b0d6f62674"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-x64.dmg"
  end

  name "OpenChatCut"
  desc "本地优先的对话式 AI 视频编辑器,多轨时间线 + LLM 自然语言剪辑"
  homepage "https://openchatcut.com/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "OpenChatCut.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rsd", "com.apple.quarantine", "{{appdir}}/OpenChatCut.app"]
  end

  uninstall quit: "dev.openchatcut.app"

  zap trash: [
    "~/Library/Application Support/OpenChatCut",
    "~/Library/Caches/dev.openchatcut.app.ShipIt",
    "~/Library/Caches/OpenChatCut",
    "~/Library/HTTPStorages/dev.openchatcut.app",
    "~/Library/Logs/OpenChatCut",
    "~/Library/Preferences/dev.openchatcut.app.plist",
    "~/Library/Saved Application State/dev.openchatcut.app.savedState",
  ]
end
