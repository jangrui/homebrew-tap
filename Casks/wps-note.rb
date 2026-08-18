cask "wps-note" do
  version "1.10.0"

  on_arm do
    sha256 "8e474f2189871c98af74c7088b6d2c65d5f45d4760ec9ff3cb3791361dfe0b56"

    url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-arm64.dmg",
        verified: "ainote.wpscdn.cn/downloads/mac/"
  end
  on_intel do
    sha256 "42ede3a1d4a96cd30c4d22c7d29c5133f1ad087241300c4748e6b6fa106da0a8"

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
