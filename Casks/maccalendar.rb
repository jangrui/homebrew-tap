cask "maccalendar" do
  version "1.7.20"
  sha256 "e6fe936b3703d9fb3753c4e0f0ac5ccb8340467df360c174d3b37e6c01298c70"

  url "https://github.com/bylinxx/MacCalendar/releases/download/v#{version}/MacCalendar.dmg"
  name "MacCalendar"
  desc "离线小而美的 macOS 菜单栏日历,支持中国农历、节假日、放假安排、系统日程"
  homepage "https://github.com/bylinxx/MacCalendar"

  depends_on macos: :sonoma

  livecheck do
    url :url
    strategy :github_releases
  end

  app "MacCalendar.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/MacCalendar.app"]
  end

  zap trash: []
end
