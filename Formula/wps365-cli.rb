class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.4"

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "e3930b651d220e9c69cee5dceb1e88b1b2480d66f8604f5ebe3a701c20ee7bb3"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "23b4f85626bf675581dbc641d6fc74354dbb9ce277c09a4bb536919dc05ce7fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "99a609349ee3cd0084319b4599fb08148da6f141ec8231e59d21ed8e1e4481ca"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "19b6b5a7950ebaf34f153ff7163d6c11ca4ca89b51988b15ec50773f264ba7b3"
    end
  end

  def install
    bin.install "wps365-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wps365-cli --version")
  end
end
