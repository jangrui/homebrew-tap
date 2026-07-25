cask "maccalendar" do
  version "1.7.2"
  sha256 "87b22ccf394297a8dd59f172326e5b899ea0dbe3d91238d5a9e81c913fdfe253"

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
