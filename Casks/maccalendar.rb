cask "maccalendar" do
  version "1.7.16"
  sha256 "1c32ced6510a573a6f46dcac69ef10b1b976127f4efb0891ae1c8cf6eb1b0fe7"

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
