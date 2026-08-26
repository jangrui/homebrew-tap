cask "marvis" do
  version :latest
  sha256 :no_check

  url "https://marvis.qq.com/download/dmg"
  name "Marvis"
  desc "腾讯 Marvis 马维斯,操作系统层级 AI 助手(本地知识库 + 跨端操控)"
  homepage "https://marvis.qq.com/"

  livecheck do
    skip "Upstream only publishes a latest/ URL"
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Marvis.app"

  uninstall quit: "com.tencent.mac.marvis"

  zap trash: [
    "~/Library/Application Support/Marvis",
    "~/Library/Caches/com.tencent.mac.marvis",
    "~/Library/Caches/com.tencent.mac.marvis.ShipIt",
    "~/Library/HTTPStorages/com.tencent.mac.marvis",
    "~/Library/Preferences/com.tencent.mac.marvis.plist",
    "~/Library/Saved Application State/com.tencent.mac.marvis.savedState",
  ]
end
