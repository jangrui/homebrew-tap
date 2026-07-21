class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.2.0"

  url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
      verified: "github.com/wps365-open/cli/"
  sha256 "773e67b45cec403ffd595aef4513bfaeac968d2b6f6638c0b3e33afb17b687ef"

  on_intel do
    url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
        verified: "github.com/wps365-open/cli/"
    sha256 "60467bd503ccbc82809769e42f8daee33a62310576ec5de71d64c7430bc108da"
  end

  def install
    bin.install "wps365-cli"
  end

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end
end
