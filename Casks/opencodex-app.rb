cask "opencodex-app" do
  version "2.72.0"
  sha256 "e770a32a1752db3794fc48772b99fa541999f28e8ec1721afd5fd649d51a1537"

  url "https://github.com/lidge-jun/opencodex/releases/download/v#{version}/OpenCodex-#{version}-macos.dmg"
  name "OpenCodex"
  desc "OpenCodex 桌面端,本地 provider 代理与仪表盘的原生窗口版(Tauri),带托盘和内置 ocx"
  homepage "https://github.com/lidge-jun/opencodex"

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
