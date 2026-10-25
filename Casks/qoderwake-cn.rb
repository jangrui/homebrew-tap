cask "qoderwake-cn" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.2-cn"
  sha256 arm:   "a4390821d62665956264a91bfc36c505229548dd4606748e082626cb42a10898",
         intel: "abb6ae917346fef6ef238577db713bbdaf32f727a126e64de5afaecbe8eac7cb"

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
