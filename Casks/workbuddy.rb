cask "workbuddy" do
  arch arm: "arm64", intel: "x64"

  version "5.3.14.36279234-825709d4"

  on_arm do
    sha256 "a7c18fecd2939f8bd7a00ab5accdd905dbc5bbd5927291c9c5762541c1bd6a61"

    url "https://download.codebuddy.cn/workbuddy/saas/darwin-arm64/WorkBuddy-darwin-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "25fe856763ff917e3086135f445c1016085ef7130433661994840e7a4c0a09ce"

    url "https://download.codebuddy.cn/workbuddy/saas/darwin-x64/WorkBuddy-darwin-x64-#{version}.dmg"
  end

  name "WorkBuddy"
  desc "腾讯出品的全场景 AI 办公工作台(自然语言下任务、多 Agent 执行、交付文档/PPT,打通腾讯文档/会议/邮箱生态)"
  homepage "https://www.workbuddy.cn/"

  livecheck do
    url "https://www.codebuddy.cn/v2/update?platform=workbuddy-darwin-arm64"
    strategy :json do |json|
      json["url"].to_s[/WorkBuddy-darwin-arm64-(.+)\.zip/, 1]
    end
  end

  depends_on macos: :big_sur

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
