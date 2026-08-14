cask "openchatcut" do
  version "0.2.2"

  on_arm do
    sha256 "cf272e33de4a5edb75a0998a2219438714a5670385665ffac9c1ec5168771d17"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg",
        verified: "github.com/0xsline/OpenChatCut/"
  end
  on_intel do
    sha256 "929b6dc68159f7fa0400fd360327943fcf41ae61f6dec1fb3dc00050a05e6a8a"

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
