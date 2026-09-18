class Opencodex < Formula
  desc "OpenAI Codex 与 Claude Code 的通用 provider 代理,接入任意 LLM"
  homepage "https://github.com/lidge-jun/opencodex"
  url "https://registry.npmjs.org/@bitkyc08/opencodex/-/opencodex-2.58.0.tgz"
  sha256 "233d8c276794a0d6f0eedf859ae50919c2ee21c306489827720d60343a75b339"
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
    (libexec/"refresh-codex-shim.js").write <<~JS
      const fs = require("node:fs");
      const path = require("node:path");
      const os = require("node:os");
      const { spawnSync } = require("node:child_process");

      const home = os.userInfo().homedir;
      const stateFile = path.join(home, ".opencodex", "codex-shim.json");
      if (!fs.existsSync(stateFile)) process.exit(0);

      const state = JSON.parse(fs.readFileSync(stateFile, "utf8"));
      for (const wrapper of state.wrappers || []) {
        const wrapperPath = wrapper && wrapper.wrapperPath;
        if (!wrapperPath || !fs.existsSync(wrapperPath)) continue;
        if (!fs.readFileSync(wrapperPath, "utf8").includes("opencodex codex autostart shim")) continue;
        fs.rmSync(wrapperPath, { force: true });
      }

      spawnSync("#{opt_bin}/ocx", ["codex-shim", "install"], {
        stdio: "ignore",
        env: {
          ...process.env,
          HOME: home,
          PATH: "#{HOMEBREW_PREFIX}/opt/node/bin:#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin",
        },
      });
    JS
  end

  post_install_steps do
    run "{{HOMEBREW_PREFIX}}/opt/node/bin/node", args: ["{{libexec}}/refresh-codex-shim.js"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ocx --version")
  end
end
