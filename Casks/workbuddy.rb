cask "workbuddy" do
  arch arm: "arm64", intel: "x64"

  version "5.8.3.41334564-db0e9b51"
  sha256 arm:   "ecd404f16f9e9f97ada77cf8211202ceb1ecd0a86ebffe1782dfea0ac7eae626",
         intel: "be38d473d41d3aed0958c80170213c90e6dba6404668849e4f7d0fda74b24f6e"

  url "https://download.codebuddy.cn/workbuddy/saas/darwin-#{arch}/WorkBuddy-darwin-#{arch}-#{version}.dmg"
  name "WorkBuddy"
  desc "腾讯出品的全场景 AI 办公工作台(自然语言下任务、多 Agent 执行、交付文档/PPT,打通腾讯文档/会议/邮箱生态)"
  homepage "https://www.workbuddy.cn/"

  livecheck do
    url "https://www.codebuddy.cn/v2/update?platform=workbuddy-darwin-arm64"
    strategy :json do |json|
      json["url"].to_s[/WorkBuddy-darwin-arm64-(.+)\.zip/, 1]
    end
  end

  depends_on :macos

  app "WorkBuddy.app"

  zap trash: [
    "~/Library/Application Support/@genie/workbuddy-desktop",
    "~/Library/Application Support/com.workbuddy.workbuddy",
    "~/Library/Caches/com.workbuddy.workbuddy",
    "~/Library/HTTPStorages/com.workbuddy.workbuddy",
    "~/Library/Logs/WorkBuddy",
    "~/Library/Preferences/com.workbuddy.workbuddy.plist",
  ]
end
