cask "minimax-design" do
  arch arm: "arm64", intel: "x64"

  version "4.0.2"
  sha256 arm:   "facb1b19e38d0bad106a11a471aad4b7db84287fa762e3897dca1739c769cd06",
         intel: "150e752b21e73fe663e7ecc2eb22b98baff16a306f4387c297693a4e69a676fc"

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
