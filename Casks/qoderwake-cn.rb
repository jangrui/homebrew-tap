cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.16-cn"

  on_arm do
    sha256 "4f7f2ac80eeaf7d793317bd7c235286cc6463a50ec6c725d795bf9864f37505f"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_arm64.dmg"
  end
  on_intel do
    sha256 "eff5d55fae273b8c7a6bc6c2650247a4ee4c5388ca616d06197d7978094e595a"

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
