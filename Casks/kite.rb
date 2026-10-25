cask "kite" do
  arch arm: "apple-silicon", intel: "intel"

  version "0.1.20"
  sha256 arm:   "cc5264ba0c438dc258e5b4410fea38fe4c9b85448476c07581f6602fad9297a1",
         intel: "8aa56fb58146403a9e1bea4758ce478a8076ffb4402df9e7808caca941632861"

  url "https://github.com/eryajf/kite-desktop/releases/download/v#{version}/Kite-v#{version}-macos-#{arch}.dmg"
  name "Kite"
  desc "基于 Wails v3 的 K8S 多集群管理桌面工具"
  homepage "https://kite-desktop.eryajf.net/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on :macos

  app "kite.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rsd", "com.apple.quarantine", "{{appdir}}/kite.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.eryajf.kite",
    "~/Library/Caches/com.eryajf.kite",
    "~/Library/Preferences/com.eryajf.kite.plist",
    "~/Library/Saved Application State/com.eryajf.kite.savedState",
    "~/Library/SDKs/kite-sdk",
  ]
end
