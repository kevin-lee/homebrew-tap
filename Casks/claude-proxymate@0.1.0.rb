cask "claude-proxymate@0.1.0" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "562ad141940995fe4a618e5039411c79e6b45d093a4e0b2bd9413b2166479608",
         intel: "fec2e3e123770cbe08daaedc937f533041e90d59ea69f335874c78a6c161ac01"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.1.0"
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
