cask "maccalendar" do
  version "1.7.24"
  sha256 "a5e942f66bcea1d6094af2e43bc962414cc9dfc7c959f02554c00e2c3cc87f46"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.dmg"
  name "MacCalendar"
  desc "离线小而美的菜单栏日历,支持中国农历、节假日、放假安排、系统日程"
  homepage "https://github.com/bylinxx/MacCalendar/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :sonoma

  app "MacCalendar.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rsd", "com.apple.quarantine", "{{appdir}}/MacCalendar.app"]
  end
end
