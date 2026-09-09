cask "wps-note" do
  version "1.15.0"

  on_arm do
    sha256 "ec0784b88ac71400cfafe92675dcbfc15910f3bfb39e7a393951c13dd4686939"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "c64919c8cc5c462584609077e725697c61dc69ed170874d7d0e395e6987f095a"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-x64.dmg"
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

  auto_updates true
  depends_on macos: :big_sur

  app "WPS笔记.app"

  uninstall quit: "cn.kdocs.ai-note"

  zap trash: [
    "~/Library/Application Support/WPS笔记",
    "~/Library/Caches/cn.kdocs.ai-note",
    "~/Library/Caches/cn.kdocs.ai-note.ShipIt",
    "~/Library/HTTPStorages/cn.kdocs.ai-note",
    "~/Library/Preferences/cn.kdocs.ai-note.plist",
    "~/Library/Saved Application State/cn.kdocs.ai-note.savedState",
  ]
end
