cask "claude-proxymate@0.1.1" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "969576f047a78192b96be56fa03676061b1bfaffba4f1b0c7b1bdf5388419d87",
         intel: "47f8364a5596772b5ace5051660ab85dd6ccc832bac0a6bb23398ec8de21247b"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.1.1"
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  zap trash: [
    "~/Library/Application Support/Claude Proxymate",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app.ShipIt",
    "~/Library/HTTPStorages/io.kevinlee.claudeproxymate.app",
    "~/Library/Preferences/io.kevinlee.claudeproxymate.app.plist",
    "~/Library/Saved Application State/io.kevinlee.claudeproxymate.app.savedState",
  ]
end
