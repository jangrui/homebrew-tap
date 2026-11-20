cask "ego-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.6.3.17"
  sha256 arm:   "96fc876664d191f593ef90566e32a575166d78c0b942e6eb1014d905bfb261cc",
         intel: "cb2f5de2ba596c659121d52ec3ba73c9018f7252a177a3bf6e2ba691c8f4f78b"

  # 上游 dmg 文件名带随机后缀(非版本号),发新版时需同步更新此处
  url "https://cdn.ego.app/setup/macos/#{arch}/egolite-Y7MbxKIuhzFB.dmg"
  name "ego lite"
  desc "为 AI Agent 打造的浏览器自动化浏览器,共享已登录状态,提供 ego-browser 命令"
  homepage "https://lite.ego.app/"

  depends_on macos: :ventura

  app "ego lite.app"

  uninstall quit: "com.citrolabs.ego.lite"

  zap trash: [
    "~/Library/Application Support/ego lite",
    "~/Library/Caches/com.citrolabs.ego.lite",
    "~/Library/HTTPStorages/com.citrolabs.ego.lite",
    "~/Library/Preferences/com.citrolabs.ego.lite.plist",
    "~/Library/Saved Application State/com.citrolabs.ego.lite.savedState",
    "~/.local/bin/ego-browser",
  ]
end
