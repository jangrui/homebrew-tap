cask "minimax-design" do
  arch arm: "arm64", intel: "x64"

  version "4.0.4"
  sha256 arm:   "3e1df5398aef4da33610ca710303bc04a3accf855d1cfdaea0b0b5c54ea3cdd1",
         intel: "c498174db42c9d627e8f9868d6d8e506f10151bc5a39b04734660d20e39e826a"

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
