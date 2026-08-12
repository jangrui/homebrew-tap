cask "workbuddy" do
  arch arm: "arm64", intel: "x64"

  version "5.3.12.35805101-a981f41f"

  on_arm do
    sha256 "a63453c98ce6a42ab00ec490cd15d2fb79264ebef640ee3713a0e9ce5e9a0283"

    url "https://download.codebuddy.cn/workbuddy/saas/darwin-arm64/WorkBuddy-darwin-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "6bd78dd8733fdfb22cac7c0b024ffe8b0174afe00a4a539560cd5c7c103462b5"

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
