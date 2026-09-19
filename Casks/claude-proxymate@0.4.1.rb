cask "claude-proxymate@0.4.1" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "02dc265ab71ba212716490ef24f2035a27c85a2a32a87b37f8d1b19f1225fab8",
         intel: "f67b0a96d4449d740d5703964ed5d00c50efb693892414c3b6a8dbf12a3e17cc"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.4.1"
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
  # The unversioned cask is checked because this cask's own caskroom_path only ever holds 0.4.1.
  preflight_steps do
    if_path_exists "Caskroom/claude-proxymate/0.1.0", base: :homebrew_prefix do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "Caskroom/claude-proxymate/0.1.1", base: :homebrew_prefix do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "Caskroom/claude-proxymate/0.1.2", base: :homebrew_prefix do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "Caskroom/claude-proxymate/0.2.0", base: :homebrew_prefix do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
  end

  zap trash: [
    "~/Library/Application Support/claude-proxymate",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app",
    "~/Library/Caches/io.kevinlee.claudeproxymate.app.ShipIt",
    "~/Library/HTTPStorages/io.kevinlee.claudeproxymate.app",
    "~/Library/Preferences/io.kevinlee.claudeproxymate.app.plist",
    "~/Library/Saved Application State/io.kevinlee.claudeproxymate.app.savedState",
  ]
end
