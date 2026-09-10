cask "minimax-design" do
  version "3.0.14"

  on_arm do
    sha256 "750857f5a60151db81a57784ff3326922d0676de60141bb980bc841b944c5419"

    url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Design-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "9db284e092818d912ca1ed93d75b197b6f5a5a40ccaf018606635356bdc4a589"

    url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Design-#{version}-x64.dmg"
  end

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
