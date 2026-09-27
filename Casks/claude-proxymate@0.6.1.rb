cask "claude-proxymate@0.6.1" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "0e3087ce77e864cf4855842916804b6395adefd06dafec2aaa4f9187881055b0",
         intel: "328843d9779734173ac070d70b047947695149e7b6d63d990f34278fa4911b77"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.6.1"
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
  # The unversioned cask is checked because this cask's own caskroom_path only ever holds 0.6.1.
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
