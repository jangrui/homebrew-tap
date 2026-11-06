cask "wps-note" do
  arch arm: "arm64", intel: "x64"

  version "1.24.1"
  sha256 arm:   "4e06de4e382a3ecf14c2f0ebf8764d2b00081f876bb42646539464719e4f14ec",
         intel: "62d555ea192da4b238b1d32e745434d6e45d9e120e9416242d1ac67d20a1dab4"

  url "https://ainote.wpscdn.cn/downloads/mac/v#{version}/WPS%E7%AC%94%E8%AE%B0-#{version}-#{arch}.dmg"
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
  depends_on :macos

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
