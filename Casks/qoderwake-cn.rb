cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.7-cn"
  sha256 arm:   "4e6c0cfd3dca26ef71b124011d64366cfc444ae3b249d618c6c7f4078bf46e86",
         intel: "3fc8777d04897262c0bba5a3080ec6b6a07799b0fcb1b59fade89a8d9a8d8e23"

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
