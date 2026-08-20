class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  version "0.3.3"

  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "e44cdb7b790004208aae0689983688b0e2bd665c9e48af83a587df3a00041b8f"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "a6ba1fb58e163b3034516c9e2baa88a1211e94a1de2b1ed3b955cf033ee16c9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "4f7d898af38bfac3021f3c2f26da7bddb53c797b39b3ecb873b04914b0b17d38"
    end
    on_intel do
      url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/wps365-open/cli/"
      sha256 "e1268632c5667358b09d162fe95b9df4697f9590de0111049c4410041f888cf8"
    end
  end

  def install
    bin.install "wps365-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wps365-cli --version")
  end
end
