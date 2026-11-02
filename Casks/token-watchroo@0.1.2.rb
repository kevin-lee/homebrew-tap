cask "token-watchroo@0.1.2" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "77cddc6ddbc42dd60f66c4cf52f3d199d98e56bfab9d48cd10f91f1a9479c5f0",
         intel: "6d6c00460033849d01684719ff4865d7acb9be89490224e12d77cf81aafebaae"

  url "https://github.com/kevin-lee/token-watchroo/releases/download/v#{version}/Token-Watchroo-#{version}-#{arch}.dmg"
  name "Token Watchroo"
  desc "Menubar app that watches Claude Code and Codex usage windows"
  homepage "https://github.com/kevin-lee/token-watchroo"

  livecheck do
    skip "Versioned cask; pinned to 0.1.2"
  end

  depends_on macos: :sonoma

  app "Token Watchroo.app"

  uninstall quit:       "io.kevinlee.tokenwatchroo",
            login_item: "Token Watchroo"

  zap trash: [
    "~/Library/Application Support/Token Watchroo",
    "~/Library/Caches/io.kevinlee.tokenwatchroo",
    "~/Library/HTTPStorages/io.kevinlee.tokenwatchroo",
    "~/Library/Preferences/io.kevinlee.tokenwatchroo.plist",
  ]
end
