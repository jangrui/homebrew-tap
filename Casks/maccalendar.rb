cask "maccalendar" do
  version "1.6.11"
  sha256 "3ce335b8fd6a12a8177d451098de2e1bd7ee0bb808f3aa22f769e115bacece97"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.dmg",
      verified: "github.com/bylinxx/MacCalendar/"
  name "MacCalendar"
  desc "离线小而美的 macOS 菜单栏日历,支持中国农历、节假日、放假安排、系统日程"
  homepage "https://github.com/bylinxx/MacCalendar"

  # 修正:原 bylinxx tap 用的是已废弃的字符串形式 depends_on macos: ">= :sonoma"
  # 新版 Homebrew 要求用符号形式。
  depends_on macos: :sonoma

  app "MacCalendar.app"

  zap trash: []
end
