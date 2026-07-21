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

  preflight do
    # Remove the pre-0.3.0 route-mode.json as its format is incompatible with 0.3.0+.
    caskroom = Pathname("#{HOMEBREW_PREFIX}/Caskroom/claude-proxymate")
    installed_versions =
      if caskroom.directory?
        caskroom.children.select(&:directory?)
                .map { |dir| dir.basename.to_s }
                .reject { |basename| basename.start_with?(".") }
      else
        []
      end
    old_version_installed = installed_versions.any? do |installed_version|
      Version.new(installed_version) < Version.new("0.3.0")
    rescue
      false
    end

    if old_version_installed
      route_mode = Pathname("#{Dir.home}/Library/Application Support/claude-proxymate/route-mode.json")
      route_mode.delete if route_mode.exist?
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
