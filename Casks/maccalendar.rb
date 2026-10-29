cask "maccalendar" do
  version "1.8.1"
  sha256 "024dc1438d9c51ac05602e275be8604f7ae33c1d9be6a34eda2a08fd1de4c873"

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
