cask "maccalendar" do
  version "1.6.10"
  sha256 "3ce335b8fd6a12a8177d451098de2e1bd7ee0bb808f3aa22f769e115bacece97"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.dmg",
      verified: "github.com/bylinxx/MacCalendar/"
  name "MacCalendar"
  desc "离线小而美的 macOS 菜单栏日历,支持中国农历、节假日、放假安排、系统日程"
  homepage "https://github.com/bylinxx/MacCalendar"

  # 修正:原 bylinxx tap 用的是已废弃的字符串形式 depends_on macos: ">= :sonoma"
  # 新版 Homebrew 要求用符号形式。
  depends_on macos: :sonoma

  # livecheck: 告诉 brew "怎么查最新版本"。
  # 配合 :github_releases 策略,brew 会查询 bylinxx/MacCalendar 的 GitHub Releases API,
  # 自动拿到最新 tag。这是自动同步 workflow 的关键。
  livecheck do
    url :url
    strategy :github_releases
  end

  app "MacCalendar.app"

  zap trash: []
end
