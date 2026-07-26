cask "maccalendar" do
  version "1.7.7"
  sha256 "c5effb191c4d60d98fd513fa81105bbdf0a06f8d2009593223399cfcb50934bc"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.dmg",
      verified: "github.com/bylinxx/MacCalendar/"
  name "MacCalendar"
  desc "离线小而美的 macOS 菜单栏日历,支持中国农历、节假日、放假安排、系统日程"
  homepage "https://github.com/bylinxx/MacCalendar"

  depends_on macos: :sonoma

  livecheck do
    url :url
    strategy :github_releases
  end

  app "MacCalendar.app"

  zap trash: []
end
