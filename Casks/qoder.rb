cask "qoder" do
  arch arm: "arm64", intel: "x64"

  version "0.4.4"

  on_arm do
    sha256 "ea4f78c7c92f095fd65a8ba5507b3a1ab52200c419932595aa8bef9ccfff6d0f"

    url "https://download.qoder.com/qoder-app/releases/#{version}/Qoder-mac-arm64.zip"
  end
  on_intel do
    sha256 "e24c7b6cbee2f29639fd22b2d0c7484420184933f04870742f90d8a20a0e8059"

    url "https://download.qoder.com/qoder-app/releases/#{version}/Qoder-mac-x64.zip"
  end

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
