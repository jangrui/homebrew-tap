class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.1"

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "8096bc4884913a901715971fc88c8da6276ddaf3712937cf4d28629285705697"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "0e1f0097dc251e74f52ed3f52185b83e27a6f77ae474ecfc359e4eab6315b029"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "24a8b4a3e854eb9e569d98216dd7623ba33ec3efb112b1f3c3d7b23ee68d67a7"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "30609d98d860abdbdc9074ac90f23b9f00821f580ba132597ecb75c9ad9195a1"
    end
  end

  def install
    bin.install "wps365-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wps365-cli --version")
  end
end
