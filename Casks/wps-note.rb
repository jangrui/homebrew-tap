cask "wps-note" do
  version "1.9.0"

  on_arm do
    sha256 "43cea207e10dca44d66ead8a9caa92760198c5dc0ef93493364b7c8a92a063ac"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-arm64.dmg",
        verified: "ainote.wpscdn.cn/downloads/mac/"
  end
  on_intel do
    sha256 "267d8495f114b8febc2b2f4ba1373a919aeac073f550f4ee958c458ed66c39f4"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-x64.dmg",
        verified: "ainote.wpscdn.cn/downloads/mac/"
  end

  name "WPS笔记"
  desc "WPS AI 笔记,录音转写 + AI 智能助理(WPS AI)+ 多端云同步"
  homepage "https://ainote.kdocs.cn/"

  livecheck do
    url "https://ainote.kdocs.cn/home/api/versions/history?client_type=mac_arm&page=1&page_size=1"
    strategy :json do |json|
      json.dig("data", "list")&.first&.dig("version")
    end
  end

  depends_on macos: :big_sur

  app "WPS笔记.app"

  zap trash: [
    "~/Library/Application Support/WPS笔记",
    "~/Library/Caches/cn.kdocs.ai-note",
    "~/Library/Caches/cn.kdocs.ai-note.ShipIt",
    "~/Library/HTTPStorages/cn.kdocs.ai-note",
    "~/Library/Preferences/cn.kdocs.ai-note.plist",
    "~/Library/Saved Application State/cn.kdocs.ai-note.savedState",
  ]
end
