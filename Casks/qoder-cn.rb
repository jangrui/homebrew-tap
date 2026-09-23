cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.32.0"

  on_arm do
    sha256 "a0f9a833b865137c40e8eace3c679ea959b6ff5143b0040202e538e331b87b62"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "5979d82b0134555f1b3babcf4d3314abee9e7a8c0218635c73ab4a500399cd6e"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
  end

  name "Qoder CN"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-ide-update-log.md"
    strategy :page_match
    regex(/\A.*?v?(\d+(?:\.\d+)+)/im)
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.aliyun.lingma.ide"

  zap trash: [
    "~/Library/Application Support/Qoder CN",
    "~/Library/Caches/com.aliyun.lingma.ide",
    "~/Library/Caches/com.aliyun.lingma.ide.ShipIt",
    "~/Library/HTTPStorages/com.aliyun.lingma.ide",
    "~/Library/Preferences/com.aliyun.lingma.ide.plist",
  ]
end
