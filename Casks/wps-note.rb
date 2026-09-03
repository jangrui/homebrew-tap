cask "wps-note" do
  version "1.14.0"

  on_arm do
    sha256 "66f7c2ad622fb3f878a96040370607adde5466f8ed2c16857c38ecad5eb86656"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6101ddda232cf3413e7b3da0df7edd964e66c9253bc97c0a9a710ef7cee79c60"

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
