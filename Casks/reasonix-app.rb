cask "reasonix-app" do
  version "1.38.7"
  sha256 "83dab447a2471815b0799ec7c6dec0e324a95a733e6b4490552cb670db81c01d"

  url "https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v#{version}/Reasonix-darwin-universal.dmg"
  name "Reasonix Desktop"
  desc "DeepSeek 原生 AI coding agent 桌面端,围绕 prefix-cache 稳定性设计"
  homepage "https://reasonix.io/"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on :macos

  app "Reasonix.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/Reasonix.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.wails.reasonix-desktop",
    "~/Library/Caches/com.wails.reasonix-desktop",
    "~/Library/Caches/reasonix",
    "~/Library/Preferences/com.wails.reasonix-desktop.plist",
    "~/Library/WebKit/com.wails.reasonix-desktop",
  ]
end
