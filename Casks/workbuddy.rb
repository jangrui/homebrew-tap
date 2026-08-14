cask "workbuddy" do
  arch arm: "arm64", intel: "x64"

  version "5.3.13.35923969-20fd9da5"

  on_arm do
    sha256 "ae5e84e7f8abce48712fb19e4819fe6441d82d89525b5223826fa5c93541e4a1"

    url "https://download.codebuddy.cn/workbuddy/saas/darwin-arm64/WorkBuddy-darwin-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "1df145586d6d2fd4c14c990518b13601072180dd51cd7ee88d5d9494b7f3fd2d"

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
