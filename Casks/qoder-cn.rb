cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.5.18"
  sha256 arm:   "09308da98ef89318ea5e868243ab9707bd877607c61088ac37fdc73c6991c104",
         intel: "4f268fb2f6ac868fbc489d7f08c0ba51a6d14f9ec13449a3127c10b431684314"

  url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-#{arch}.zip"
  name "Qoder CN"
  desc "阿里云以编程智能体为核心的智能体工作空间"
  homepage "https://qoder.cn/"

  livecheck do
    url "https://static.qoder.com.cn/qoder-app/releases/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.qodercn.app"

  zap trash: [
    "~/Library/Application Support/com.qodercn.app.stable",
    "~/Library/Application Support/QoderCN",
    "~/Library/Caches/com.qodercn.app",
    "~/Library/Caches/com.qodercn.app.ShipIt",
    "~/Library/Caches/qoder-cn-updater",
    "~/Library/HTTPStorages/com.qodercn.app",
    "~/Library/Preferences/com.qodercn.app.plist",
    "~/Library/Saved Application State/com.qodercn.app.savedState",
    "~/Library/WebKit/com.qodercn.app",
  ]
end
