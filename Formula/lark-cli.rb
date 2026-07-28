class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.79"

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "faa75806d61d5ec78b64ce55c75c6e269d1558f43522312dd292d40e3f3aae95"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "53e14858b8aa909ababc618086d4fae787271086f37c3ef216424b4d3417beb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-arm64.tar.gz"
      sha256 "bebd9eea7cc3c17c86249e32076e417f915a231e6cc6e2bfb553f148896c7696"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-amd64.tar.gz"
      sha256 "d2b03602e550d23f685a3f49b7af5bafa481464cbdd19caae57ab2c67a95c9c4"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
