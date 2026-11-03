cask "reasonix-app" do
  version "1.39.11"
  sha256 "99dea2bcfb627fd5a28313a1a03838b854420d11298494a572380c0f83bc8e7c"

  url "https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v#{version}/Reasonix-darwin-universal.dmg"
  name "Reasonix Desktop"
  desc "DeepSeek 原生 AI coding agent 桌面端,围绕 prefix-cache 稳定性设计"
  homepage "https://reasonix.io/"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :ventura

  app "Reasonix.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rsd", "com.apple.quarantine", "{{appdir}}/Reasonix.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.wails.reasonix-desktop",
    "~/Library/Caches/com.wails.reasonix-desktop",
    "~/Library/Caches/reasonix",
    "~/Library/Preferences/com.wails.reasonix-desktop.plist",
    "~/Library/WebKit/com.wails.reasonix-desktop",
  ]
end
