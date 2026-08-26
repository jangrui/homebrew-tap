cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.9-cn"

  on_arm do
    sha256 "060eb0f8221f358715e5eba7096074d92ceec2fd34861f165f8a7e716b341e69"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_arm64.dmg"
  end
  on_intel do
    sha256 "45e2fbb2d037ff847e897e5b2fdfbfc35701ad41705c158b92ebe2e951abfb38"

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
