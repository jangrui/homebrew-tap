class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.88"

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "f1f40fb3fbae05c0786ffd515ee3719cdee3804766e4fa93e952596163cde7ac"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "88b216bf2b9fab548f3b8fb0e396dd163028ea6cf850a2268b69d6d58b8b2a38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-arm64.tar.gz"
      sha256 "96a3cac444947456ce9971c912946323f20d14416434da7e274bd9d77d7ac28b"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-amd64.tar.gz"
      sha256 "497de20939acdd2aae4c898fea7a0ca71d5a459ed543202e762a8bcb3228effe"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
