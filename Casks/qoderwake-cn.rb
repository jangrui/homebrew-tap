cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.8-cn"

  on_arm do
    sha256 "8c9f48d336ed55de8b0ce83f83ba82786549e32bff3fa7e98c06e34173183046"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_arm64.dmg"
  end
  on_intel do
    sha256 "2c6a92361c6cb8ac9a2b3a6f6482219ae2ce68b3c10c031da85c5237ef3b7c1a"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_amd64.dmg"
  end

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
