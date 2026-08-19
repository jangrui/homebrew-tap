cask "openchatcut" do
  version "0.2.8"

  on_arm do
    sha256 "7844fdfb3898c3ee8452fb32fb768ccae4046ed59b38753c7c73c91e3cb7a232"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg",
        verified: "github.com/0xsline/OpenChatCut/"
  end
  on_intel do
    sha256 "b937c7336f97b935039e0186874edfc2f7f2a928e698fefd2ec9ad3bde7c8819"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-x64.dmg",
        verified: "github.com/0xsline/OpenChatCut/"
  end

  name "OpenChatCut"
  desc "本地优先的对话式 AI 视频编辑器,多轨时间线 + LLM 自然语言剪辑"
  homepage "https://github.com/0xsline/OpenChatCut"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "OpenChatCut.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/OpenChatCut.app"]
  end

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
