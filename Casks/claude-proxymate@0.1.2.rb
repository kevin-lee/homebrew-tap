cask "claude-proxymate@0.1.2" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "4dd6eb5d3ca7f21b863a516fdfc0357f0185d9ee619c47e9c03f149bdae5370a",
         intel: "25d9408ab627597876d7beaf0a3362cc09955f15206143079daf54390c75924e"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.1.2"
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  zap trash: [
    "~/Library/Application Support/claude-proxymate",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app.ShipIt",
    "~/Library/HTTPStorages/io.kevinlee.claudeproxymate.app",
    "~/Library/Preferences/io.kevinlee.claudeproxymate.app.plist",
    "~/Library/Saved Application State/io.kevinlee.claudeproxymate.app.savedState",
  ]
end
