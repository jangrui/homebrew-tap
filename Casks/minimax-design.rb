cask "minimax-design" do
  arch arm: "arm64", intel: "x64"

  version "4.0.16"
  sha256 arm:   "0338c56c33e39f9065dafa9e71ee0b0482bab70d40804f12032d1c68623477c9",
         intel: "6daaed2408e0345992dfa38c431445aff49c64c091bc02c26cadb0e1d0b1473c"

  url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Design-#{version}-#{arch}.dmg"
  name "MiniMax Design"
  desc "MiniMax AI Agent 创作平台,覆盖调研、脚本、图像、视频、配音的完整内容生产链路"
  homepage "https://design.minimaxi.com/"

  livecheck do
    url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/releases.osx-arm64.json"
    strategy :json do |json|
      json["Assets"]&.filter_map { |asset| asset["Version"] if asset["Type"] == "Full" }
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "MiniMax Design.app"

  uninstall quit: "com.minimax.hub"

  zap trash: [
    "~/Library/Application Support/@hilo",
    "~/Library/Application Support/MiniMax Hub",
    "~/Library/Caches/@hilo",
    "~/Library/Caches/com.minimax.hub",
    "~/Library/Caches/MiniMax Hub",
    "~/Library/HTTPStorages/com.minimax.hub",
    "~/Library/Preferences/com.minimax.hub.plist",
  ]
end
