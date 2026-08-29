class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.92"

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "abb1b96eee5ad32da4e12f434e44d48a9e01ebb0e81772419ac0347f91c34265"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "421b36f95966028fb047231cb6351c4224a0fdcb076d2bc434d4aed1bb6d1891"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-arm64.tar.gz"
      sha256 "683546b6754c780e0f828e87cb00ccf7c0710798a9f1ddb8c6b956afbfb570ae"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-amd64.tar.gz"
      sha256 "ef0e19799c1edd94eb52d3bb5d587e00d0a2898e0a4b407a1b8dc66d56181ef1"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
