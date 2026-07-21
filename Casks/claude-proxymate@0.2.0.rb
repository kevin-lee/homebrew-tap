cask "claude-proxymate@0.2.0" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "d494a8ae459950d25d16ff9ae7b12cb81b851b103029ff265ff7277656d56ca8",
         intel: "28bc7ab3e5bae4bde51a740e7766aa904c451521fdba033a9fbaea984663e57a"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.2.0"
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
