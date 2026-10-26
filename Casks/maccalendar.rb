cask "maccalendar" do
  version "1.7.29"
  sha256 "af588e7e6d098722708d82e8c8e2da1bd8b603506675e25e48462d4d68c0206d"

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
