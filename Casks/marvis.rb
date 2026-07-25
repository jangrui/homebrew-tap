cask "marvis" do
  version :latest
  sha256 :no_check

  # 官网 /download/dmg 永远 302 到当前最新 dmg(installer/<supid>/marvis_<ver>_arm64_<channelId>.dmg)。
  # 上游换 installer 号/版本号都能跟上。只发 arm64:对 Intel UA 同样 redirect 到 arm64 包。
  url "https://marvis.qq.com/download/dmg",
      verified: "marvis.qq.com/download/"
  name "Marvis"
  desc "腾讯 Marvis 马维斯,操作系统层级 AI 助手(本地知识库 + 跨端操控)"
  homepage "https://marvis.qq.com/"

  # 上游无公开 manifest/feed/appcast,更新走客户端私有接口(需登录态),
  # 无法 livecheck。bump 时手动跟随官网下载地址换 sha256 即可。
  livecheck do
    skip "Upstream only publishes a latest/ URL"
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Marvis.app"

  zap trash: [
    "~/Library/Application Support/Marvis",
    "~/Library/Caches/com.tencent.mac.marvis",
    "~/Library/Caches/com.tencent.mac.marvis.ShipIt",
    "~/Library/HTTPStorages/com.tencent.mac.marvis",
    "~/Library/Preferences/com.tencent.mac.marvis.plist",
    "~/Library/Saved Application State/com.tencent.mac.marvis.savedState",
  ]
end
