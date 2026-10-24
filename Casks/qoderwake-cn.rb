cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.1-cn"
  sha256 arm:   "a7a0bff1cb49f9dfb7fd6a0f27871c29dda5a58afc84a0182fc04dae44db79db",
         intel: "cb9bab937be5cedebb551c1e0d47cfb20859043e5ab62d2533a41aef66bc2d6d"

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
