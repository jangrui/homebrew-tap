cask "opencodex-app" do
  version "2.94.0"
  sha256 "0f298a4bf467ffcebd2a3a5569eb1ba59716662a756303bb1eee03392bf09af3"

  url "https://github.com/lidge-jun/opencodex/releases/download/v#{version}/OpenCodex-#{version}-macos.dmg"
  name "OpenCodex"
  desc "OpenCodex 桌面端,本地 provider 代理与仪表盘的原生窗口版(Tauri),带托盘和内置 ocx"
  homepage "https://opencodex.me/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :ventura

  app "OpenCodex.app"

  zap trash: [
    "~/Library/Application Scripts/com.opencodex.desktop.widget",
    "~/Library/Application Support/com.opencodex.desktop",
    "~/Library/Caches/com.opencodex.desktop",
    "~/Library/Containers/com.opencodex.desktop.widget",
    "~/Library/Preferences/com.opencodex.desktop.plist",
    "~/Library/Saved Application State/com.opencodex.desktop.savedState",
    "~/Library/WebKit/com.opencodex.desktop",
  ]
end
