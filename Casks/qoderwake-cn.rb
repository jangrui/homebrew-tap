cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.6-cn"

  on_arm do
    sha256 "718f9a9163f9fe03e098de677f1afdc9d61cb0831e4963a781378679e962ef07"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_arm64.dmg"
  end
  on_intel do
    sha256 "3f9b20dd8e50a6918097efe61af7368c334e04b2204e1fb847fbef66e2c46939"

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
