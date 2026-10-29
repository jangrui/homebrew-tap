cask "wps-note" do
  arch arm: "arm64", intel: "x64"

  version "1.23.1"
  sha256 arm:   "4a1f06264fa82a7b46a4b9368dc65128ce5f29eb662f239daff8aee49302be53",
         intel: "00203f25befe481ef0d214daa7f96de8751dc73bbdb26ed099ea064795c65d67"

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
