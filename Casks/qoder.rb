cask "qoder" do
  arch arm: "arm64", intel: "x64"

  version "0.5.21"
  sha256 arm:   "72abf9fb84b450a5d186f719bf56d3bb042ede2179e53e0bceb23f6ea482c008",
         intel: "f3d0a8aa69640703331a057d79f00d1b2d8dddeacc127319a27b2265aa78d850"

  url "https://download.qoder.com/qoder-app/releases/#{version}/Qoder-mac-#{arch}.zip"
  name "Qoder"
  desc "阿里 Qoder 国际版,以编程智能体为核心的智能体工作空间"
  homepage "https://qoder.com/"

  livecheck do
    url "https://download.qoder.com/qoder-app/releases/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder.app"

  uninstall quit: "com.qoder.app"

  zap trash: [
    "~/Library/Application Support/com.qoder.app.stable",
    "~/Library/Application Support/Qoder",
    "~/Library/Caches/com.qoder.app",
    "~/Library/Caches/com.qoder.app.ShipIt",
    "~/Library/Caches/qoder-updater",
    "~/Library/HTTPStorages/com.qoder.app",
    "~/Library/Preferences/com.qoder.app.plist",
    "~/Library/Saved Application State/com.qoder.app.savedState",
    "~/Library/WebKit/com.qoder.app",
  ]
end
