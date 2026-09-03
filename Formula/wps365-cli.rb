class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.5"

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "819c0706c25af0ff694f5eb924bfe2dcd89b8321589ef3b34ed438cac48b93e5"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "98f417deb55f544ca79bd01deb5e651a72e18ac1c244a3f027c95cc2dc50d0e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "13c2aae59922b1b149fa61ce007be80ed6cd86e7adc21d33baffb32c16972543"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "eed4408786da4e4abc10bfe78275ab6a8f3f021bba1c7b6625616077fb7e84d0"
    end
  end

  def install
    bin.install "wps365-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wps365-cli --version")
  end
end
