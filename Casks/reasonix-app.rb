cask "reasonix-app" do
  version "1.23.0"
  sha256 "02d0efa23402bd139842937592fbc6eda0777acd1c46febb406d0502eeafce57"

  url "https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v#{version}/Reasonix-darwin-universal.dmg",
      verified: "github.com/esengine/DeepSeek-Reasonix/"
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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "/Applications/Reasonix.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.wails.reasonix-desktop",
    "~/Library/Caches/com.wails.reasonix-desktop",
    "~/Library/Caches/reasonix",
    "~/Library/Preferences/com.wails.reasonix-desktop.plist",
    "~/Library/WebKit/com.wails.reasonix-desktop",
  ]
end
