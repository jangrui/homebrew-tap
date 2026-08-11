cask "wps-note" do
  version "1.8.0"

  on_arm do
    sha256 "4ee9d5fee3b3893ff8e3372666b4bd5207140818453ee99409455df2397bcdac"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-arm64.dmg",
        verified: "ainote.wpscdn.cn/downloads/mac/"
  end
  on_intel do
    sha256 "b09b13b9e1041489db2f317d54849e006297bbc4fd16a8c48ec3e9556fcf8743"

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
