cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.14-cn"
  sha256 arm:   "9e808638bf8ee70f9e63e79cb42a5b06853ea62f19f5b1c6dca79a9e67c57083",
         intel: "25a6ba3f070aa36d5911207138eb91e2c9fb49a196c2f74c0c840577927cbceb"

  url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_#{arch}.dmg"
  name "QoderWake CN"
  desc "全天在线的数字员工,自主完成工作"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://ide.qoder.com.cn/qoderwake-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "QoderWake CN.app"

  zap trash: [
    "~/Library/Application Support/QoderWake CN",
    "~/Library/Caches/com.qoder.QoderWakeCN.MenuBar",
    "~/Library/HTTPStorages/com.qoder.QoderWakeCN.MenuBar",
    "~/Library/Preferences/com.qoder.QoderWakeCN.MenuBar.plist",
  ]
end
