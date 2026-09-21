class DbxMcp < Formula
  desc "DBX 数据库 MCP server,让 AI agent 查询 MySQL/PostgreSQL 等数据库"
  homepage "https://github.com/t8y2/dbx/tree/main/packages/mcp-server"
  url "https://registry.npmjs.org/@dbx-app/mcp-server/-/mcp-server-0.4.93.tgz"
  sha256 "836c999b1e5c1fb085d9c742cb851e9855b0fc8e1cb5e40346f1693a20d1d302"
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
