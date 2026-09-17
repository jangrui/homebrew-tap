class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.6"

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "2605dab1a208327e3fc3b739d589c878ad17c7a22a133dd26171e76c6f81c08f"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "d7c63d3e59446bf0a27361282a7751a818791752bcb8c9b478cb937ff8216f33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "f9de5dc0a0e5a682bd53c9df8e21196a6090b308db2c339b516f6389ecea0ab3"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "68b955a8488edcb82ed5373752a937d9ec3588abfb550223dda3d6f0c1a27588"
    end
  end

  def install
    bin.install "wps365-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wps365-cli --version")
  end
end
