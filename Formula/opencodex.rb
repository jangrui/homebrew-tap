class Opencodex < Formula
  desc "OpenAI Codex 与 Claude Code 的通用 provider 代理,接入任意 LLM"
  homepage "https://github.com/lidge-jun/opencodex"
  url "https://registry.npmjs.org/@bitkyc08/opencodex/-/opencodex-2.38.0.tgz"
  sha256 "504c53e21a3dadb155eb29cb4746b83b889208ad6ca97acfbf8127b949aab28a"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@bitkyc08/opencodex/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")
  end

  def post_install
    real_home = Pathname.new(Etc.getpwuid.dir)
    shim_state = real_home/".opencodex/codex-shim.json"
    return unless shim_state.exist?

    ocx = opt_bin/"ocx"
    state = JSON.parse(shim_state.read)
    Array(state["wrappers"]).each do |w|
      path = Pathname.new(w["wrapperPath"])
      next if !path.exist? || path.read.exclude?("opencodex codex autostart shim")

      rm path
    end

    with_env(
      HOME: real_home.to_s,
      PATH: "#{HOMEBREW_PREFIX}/opt/node/bin:#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin",
    ) do
      quiet_system ocx.to_s, "codex-shim", "install"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ocx --version")
  end
end
