cask "openchatcut" do
  version "0.2.9"

  on_arm do
    sha256 "ff946e20a5cd449de01f460fa27dec2ccaceb411e3af07b460da9733f786733d"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg",
        verified: "github.com/0xsline/OpenChatCut/"
  end
  on_intel do
    sha256 "c809df298977f9b91d166196c52a6c809efc620be0405656a24f2bb30ae89368"

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
