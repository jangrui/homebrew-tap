cask "deepseek-harness" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1-rc.1"
  sha256 arm:   "702e688204cff14b6a0614257d0333636a052dfa7cf4f457dbeaf98b718c3ca3",
         intel: "932c56d1c8e99f6f9b03c5c0ba71fade20c018a34029668c37522ebcf1c2a122"

  url "https://download.deepseek.com/dsh-desk/bin/mac-#{arch}/deepseek-harness-#{version}-mac-#{arch}.dmg"
  name "DeepSeek Harness"
  desc "DeepSeek 官方 AI Agent 桌面工作台(Harness)"
  homepage "https://deepseek.com/harness"

  livecheck do
    url "https://github.com/deepseek-ai/deepseek-harness"
    strategy :github_releases do |json, regex|
      archs = %w[arm64 x64]
      ok_codes = %w[200 206]
      json = [json] unless json.is_a?(Array)
      versions = json.filter_map { |release| release["tag_name"][regex, 1] if release["tag_name"] }.uniq
      versions.sort_by { |version| ::Version.new(version) }.rfind do |version|
        archs.all? do |arch|
          dmg = "https://download.deepseek.com/dsh-desk/bin/mac-#{arch}/deepseek-harness-#{version}-mac-#{arch}.dmg"
          headers = ::Utils::Curl.curl_output("--silent", "--location", "--head", "--max-time", "20", dmg).stdout
          ok_codes.include?(headers.scan(%r{^HTTP/\S+\s+(\d+)}).last&.first)
        end
      end
    end
    regex(/^\Adsh-v?(\d+(?:\.\d+)+(?:-rc\.\d+)?)\z/i)
  end

  depends_on macos: :ventura

  app "DeepSeek Harness.app"

  uninstall quit: "com.deepseek.dsh"

  zap trash: [
    "~/Library/Application Support/@deepseek-ai/dsh-desktop",
    "~/Library/Caches/com.deepseek.dsh",
    "~/Library/Caches/com.deepseek.dsh.ShipIt",
    "~/Library/HTTPStorages/com.deepseek.dsh",
    "~/Library/Logs/com.deepseek.dsh",
    "~/Library/Preferences/com.deepseek.dsh.plist",
    "~/Library/Saved Application State/com.deepseek.dsh.savedState",
    "~/Library/WebKit/com.deepseek.dsh",
  ]
end
