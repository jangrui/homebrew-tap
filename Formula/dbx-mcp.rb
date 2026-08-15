class DbxMcp < Formula
  desc "DBX 数据库 MCP server,让 AI agent 查询 MySQL/PostgreSQL 等数据库"
  homepage "https://github.com/t8y2/dbx/tree/main/packages/mcp-server"
  url "https://registry.npmjs.org/@dbx-app/mcp-server/-/mcp-server-0.4.63.tgz"
  sha256 "7b0b91db69010bac82aae30b099f1d2090db2ce8aecfdc8f89dc6fc9cdd4b5a9"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/@dbx-app/mcp-server/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    init = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":' \
           '{"protocolVersion":"2024-11-05","capabilities":{},' \
           '"clientInfo":{"name":"brew-test","version":"1"}}}'
    assert_match %Q("version":"#{version}"), pipe_output(bin/"dbx-mcp-server", init)
  end
end
