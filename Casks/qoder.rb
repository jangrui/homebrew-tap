cask "qoder" do
  arch arm: "arm64", intel: "x64"

  version "0.4.8"
  sha256 arm:   "e388a9831ac5a77af9ba6a2ad5cb3b5c11065c7f06a1fd18c11714b2525aeeda",
         intel: "3c45cc35f3562c23dce0ca2d0a74e3b63c513b3f532882e89df40c3da5eaf2ef"

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
