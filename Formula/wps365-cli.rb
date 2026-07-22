class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.1"

  url "https://github.com/wps365-open/cli/releases/download/v0.3.1/wps365-cli-x86_64-apple-darwin.tar.gz",
      verified: "github.com/wps365-open/cli/"
  sha256 "0e1f0097dc251e74f52ed3f52185b83e27a6f77ae474ecfc359e4eab6315b029"

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
