cask "kite" do
  version "0.1.20"

  desc "基于 Wails v3 的 K8S 多集群管理桌面工具"
  homepage "https://github.com/eryajf/kite-desktop"

  # macOS 分 apple-silicon 和 intel 两个 dmg,sha256 不同。
  # 用 on_arm / on_intel 按当前机器架构选对的。
  on_arm do
    sha256 "cc5264ba0c438dc258e5b4410fea38fe4c9b85448476c07581f6602fad9297a1"
    url "https://github.com/eryajf/kite-desktop/releases/download/v#{version}/Kite-v#{version}-macos-apple-silicon.dmg",
        verified: "github.com/eryajf/kite-desktop/"
  end
  on_intel do
    sha256 "8aa56fb58146403a9e1bea4758ce478a8076ffb4402df9e7808caca941632861"
    url "https://github.com/eryajf/kite-desktop/releases/download/v#{version}/Kite-v#{version}-macos-intel.dmg",
        verified: "github.com/eryajf/kite-desktop/"
  end

  depends_on macos: :catalina

  # livecheck:GitHub Releases 策略 + 从 tag 提取纯版本号(去掉前缀 v)
  livecheck do
    url :url
    strategy :github_releases
  end

  app "Kite.app"

  zap trash: [
    "~/Library/Application Support/com.eryajf.kite",
    "~/Library/Caches/com.eryajf.kite",
    "~/Library/Preferences/com.eryajf.kite.plist",
    "~/Library/SDKs/kite-sdk",
    "~/Library/Saved Application State/com.eryajf.kite.savedState",
  ]
end
