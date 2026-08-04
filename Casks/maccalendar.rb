cask "maccalendar" do
  version "1.7.19"
  sha256 "5c455ff91a7869a26f1d3ed0bd491c31f835e117519879b40faff9108e84610f"

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
