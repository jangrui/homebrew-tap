cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.27-cn"
  sha256 arm:   "e43d306ccfc59dcdaa82d992fc3d82181717740f881f6e595adc68740b555273",
         intel: "2d29ee234ce7a654a0818dbaa569ff136bf64eefee83251c8a4359a002565d2b"

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
