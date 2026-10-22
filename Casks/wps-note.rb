cask "wps-note" do
  arch arm: "arm64", intel: "x64"

  version "1.22.0"
  sha256 arm:   "eaa82e0546f4493688562ffc0b10a40b263493d15be21370880d57939cdc2c06",
         intel: "a087db0b24bfd59778e1089519a22118321b8c1f4222cb960dafbca5db157e9f"

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
