cask "openchatcut" do
  version "0.2.16"

  on_arm do
    sha256 "1939ea9198eb7339124287191369d21bcc095f91ec4956180623e25f6b201a71"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "c618e1bc59b64750d2bedf12eeb593b81e6b53e6a290c83b4326b34f1941e3c6"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-x64.dmg"
  end

  name "OpenChatCut"
  desc "本地优先的对话式 AI 视频编辑器,多轨时间线 + LLM 自然语言剪辑"
  homepage "https://github.com/0xsline/OpenChatCut"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "OpenChatCut.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/OpenChatCut.app"]
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
