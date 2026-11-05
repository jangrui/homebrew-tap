class QoderCliCn < Formula
  desc "终端原生的 AI 编程搭档,也是可被集成的智能体引擎"
  homepage "https://qoder.com.cn/"
  version "1.1.83"

  livecheck do
    url "https://static.qoder.com.cn/qoder-cli-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  on_macos do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-arm64.tar.gz"
      sha256 "53d2204f090517273adc1040a6bf6fc8491d00d2f68e52c40a191fe113a97294"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-x64.tar.gz"
      sha256 "2e1d9fa84ce1168f3fed66c85076a448ac16f44a8068658431519c20447265aa"
    end
  end

  on_linux do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-arm64.tar.gz"
      sha256 "085619b9d73282c303bdad05bf62553cd58e6c0a496e67fa1f2faff413b9c8ce"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-x64.tar.gz"
      sha256 "83c7fc9cdbdc4d8b5f0469744e09c3e51bb8df568f1e91c5891215ac9efce191"
    end
  end

  def install
    bin.install "qoderclicn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qoderclicn --version")
  end
end
