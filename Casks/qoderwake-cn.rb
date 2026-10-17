cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.12-cn"
  sha256 arm:   "f68c1138cb49e5914373f7b60e8e53b963f5b1ea30a4247e6e171d64b5c4f963",
         intel: "53cee6032d6299861ae0c846c23eaeab5ed6d1b38aaa530afa9b3066892f1fcd"

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
