cask "opencodex-app" do
  version "2.77.0"
  sha256 "75a6a1801326ae06775c6e00e2c1adcf71f8942d96405d6b6f059fc91e646bfb"

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
