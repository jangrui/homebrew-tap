cask "qoder" do
  arch arm: "arm64", intel: "x64"

  version "0.5.11"
  sha256 arm:   "43fd1a64170c91d1ab27ef17781c1e8c1ea13172087ae79ac061802e0868e821",
         intel: "cffec448de9650a962cf942af7378bdc57b3852c1d451a090879d93c1d48b713"

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
