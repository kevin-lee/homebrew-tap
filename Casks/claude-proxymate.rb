cask "claude-proxymate" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "afc25afb408669352c1c10d7a206bc887ac04e1e6ae3364d07efc35994e56cbe",
         intel: "6bb4803b6f4013a032fa9a56c366c40bc86c2273dc3eba1f389f943bedcf2bb9"

  url "https://github.com/kevin-lee/claude-proxymate/releases/download/v#{version}/Claude-Proxy-#{version}-#{arch}.dmg"
  name "Claude Proxymate"
  desc "Proxy app to analyze Claude Code's live traffic"
  homepage "https://github.com/kevin-lee/claude-proxymate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Claude Proxymate.app"

  # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
  preflight_steps do
    if_path_exists "0.1.0", base: :caskroom_path do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "0.1.1", base: :caskroom_path do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "0.1.2", base: :caskroom_path do
      remove "Library/Application Support/claude-proxymate/route-mode.json", base: :home
    end
    if_path_exists "0.2.0", base: :caskroom_path do
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
