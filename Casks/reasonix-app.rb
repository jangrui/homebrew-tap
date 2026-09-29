cask "reasonix-app" do
  version "1.39.5"
  sha256 "ef6df566eda61db1099ccd794c13cba5f24c8547338a05d4a67240031e078095"

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
