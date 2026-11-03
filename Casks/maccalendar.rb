cask "maccalendar" do
  version "1.9.0"
  sha256 "c85fae573c6f6c46824bbb4444e67c9cfff6fbb142d0fc9ad8f8232500f71bcc"

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
