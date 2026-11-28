cask "ego-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.6.4.22"
  sha256 arm:   "7ba2cbb488131b4e7c635382ba22272374c41c137c74adf0591703ee6107c7b8",
         intel: "87b91b44db0fe947854cf5d12368db248dc31644051895ba325bd7fcf9f70cb2"

  url "https://cdn.ego.app/setup/macos/#{arch}/egolite.dmg"
  name "ego lite"
  desc "为 AI Agent 打造的浏览器自动化浏览器,共享已登录状态,提供 ego-browser 命令"
  homepage "https://lite.ego.app/"

  # 固定地址,版本号来自 CDN 响应头
  livecheck do
    url :url
    strategy :header_match do |headers|
      headers["x-amz-meta-omaha-version"]
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "ego lite.app"

  uninstall quit: "com.citrolabs.ego.lite"

  zap trash: [
    "~/.local/bin/ego-browser",
    "~/Library/Application Support/ego lite",
    "~/Library/Caches/com.citrolabs.ego.lite",
    "~/Library/HTTPStorages/com.citrolabs.ego.lite",
    "~/Library/Preferences/com.citrolabs.ego.lite.plist",
    "~/Library/Saved Application State/com.citrolabs.ego.lite.savedState",
  ]
end
