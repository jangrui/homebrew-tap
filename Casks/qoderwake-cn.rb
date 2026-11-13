cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.17-cn"
  sha256 arm:   "13d9bc2d3aebae17efba2bda3c987f09d3c0983a55e8874fb16122bfae295e5d",
         intel: "a0081073f4b828b46bd1f5e3c86140a3867f6dd6f9a138fd22bba44131cee7c9"

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
