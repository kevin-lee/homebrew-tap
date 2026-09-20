cask "claude-proxymate@0.5.0" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "1222cba7da34d1e1979321b0d164e7182bb138401b20f22627f24cb60bffaa29",
         intel: "8fbe0ad53e931a3acea3ad9dbac8ea7652bc104cfab0c67939f105dc5fb38d28"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.5.0"
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
  # The unversioned cask is checked because this cask's own caskroom_path only ever holds 0.5.0.
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
