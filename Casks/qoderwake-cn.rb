cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.4-cn"

  on_arm do
    sha256 "aad072aac09ce042be713fad74b2a79220c02cee13b5629bbf062ea57634b76c"

    url "https://ide.qoder.com.cn/qoderwake-cn/installers/#{version}/qoderwake-cn_#{version}_darwin_arm64.dmg"
  end
  on_intel do
    sha256 "d7fc51a0b335029e0196c931cea2d5687f54abd74a2d5d082e81e8aa9f2a7281"

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
