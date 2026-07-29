cask "openchatcut" do
  version "0.1.7"

  on_arm do
    sha256 "8ebb69bd3a774d7c54061dd28e89aca6b292d0fa88134a698357a4c1fc0c8791"

    url "https://github.com/0xsline/OpenChatCut/releases/download/v#{version}/OpenChatCut-#{version}-arm64.dmg",
        verified: "github.com/0xsline/OpenChatCut/"
  end
  on_intel do
    sha256 "4801f6ec348ffd85cdd21daa2de22848e0b8276fb8bd6c3dfaa86b7e079b1986"

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
