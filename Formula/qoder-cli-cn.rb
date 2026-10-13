class QoderCliCn < Formula
  desc "终端原生的 AI 编程搭档,也是可被集成的智能体引擎"
  homepage "https://qoder.com.cn/"
  version "1.1.70"

  livecheck do
    url "https://static.qoder.com.cn/qoder-cli-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  on_macos do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-arm64.tar.gz"
      sha256 "9515658d17bb86790f96b57b5b01d76ad402169c3f432cfac67212fad8969770"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-x64.tar.gz"
      sha256 "add3bbb6f197392f035dd017aba95c281f65e994b6e2f4b8b58c61304ef2b4d8"
    end
  end

  on_linux do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-arm64.tar.gz"
      sha256 "13783d530b8fae1c4875767272078fc9f214ed5a78590f87421c99fd4feac130"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-x64.tar.gz"
      sha256 "e0fd6925636611127af2134fb8bb1b8d990fa4091642174bb3f97d203b67dd25"
    end
  end

  def install
    bin.install "qoderclicn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qoderclicn --version")
  end
end
