cask "claude-proxymate@0.8.0" do
  arch arm: "arm64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "63b6d0fbec750ca5420a1e84bb118bf03d74cc4f13368c0582e46413719c7129",
         intel: "22f5dd5638db0ea753750927efdddfccd40748f529e422f70ed8b028200661f8"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    skip "Versioned cask; pinned to 0.8.0"
  end

  auto_updates true
  depends_on macos: :monterey

  app "Claude Proxymate.app"

  # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
  # The unversioned cask is checked because this cask's own caskroom_path only ever holds 0.8.0.
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
