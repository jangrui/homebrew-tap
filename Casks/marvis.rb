cask "marvis" do
  version "1.60.1111,520,4000000002"
  sha256 "1ad5e868292f027fa1e200a69f631bf2845344e7e86d9ffb1ade67163edea179"

  url "https://down.marvis.qq.com/marvis/pipeline/installer/#{version.csv.second}/marvis_#{version.csv.first}_arm64_#{version.csv.third}.dmg"
  name "Marvis"
  desc "腾讯 Marvis 马维斯,操作系统层级 AI 助手(本地知识库 + 跨端操控)"
  homepage "https://marvis.qq.com/"

  # 下载入口 302 到带版本的地址,三段(版本,构建号,渠道号)都从跳转地址取
  livecheck do
    url "https://marvis.qq.com/download/dmg"
    regex(%r{/installer/(\d+)/marvis[._-]v?(\d+(?:\.\d+)+)_arm64_(\d+)\.dmg}i)
    strategy :header_match do |headers, regex|
      match = headers["location"]&.match(regex)
      next if match.blank?

      "#{match[2]},#{match[1]},#{match[3]}"
    end
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
