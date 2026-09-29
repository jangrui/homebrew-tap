cask "openchatcut" do
  version "0.2.15"

  on_arm do
    sha256 "c10e71825f6348c8d44024b1349622c307c6a138f93134e54bb2c093c77db231"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "a2cf1d7af0648f12b842d0be438d9203d2ac8019a2fa72f7205984e6ed5b4950"

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
