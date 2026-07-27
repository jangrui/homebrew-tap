cask "mouser" do
  version "3.7.2"

  on_arm do
    sha256 "1bccc07e469b67fbada54ce3b0630785be70df2c2cd0842c5510a0295eac2213"

    url "https://github.com/TomBadash/Mouser/releases/download/v#{version}/Mouser-macOS.zip"
  end
  on_intel do
    sha256 "c7936598a687223f6637f4896d5e2ee2de316e14a15cebfa2eae28071badc2f7"

    url "https://github.com/TomBadash/Mouser/releases/download/v#{version}/Mouser-macOS-intel.zip"
  end

  name "Mouser"
  desc "Logitech Options+ 开源替代品,HID++ 鼠标按键重映射 + 按应用配置"
  homepage "https://github.com/TomBadash/Mouser"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "Mouser.app"

  zap trash: "~/Library/Application Support/Mouser"
end
