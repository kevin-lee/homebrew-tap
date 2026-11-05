cask "token-watchroo@0.2.0" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "98c7fc4149bef90c7db8ced1e2efc6241de771f93eb421fe5cba43e7d3091968",
         intel: "13a7b2235dac40ea9234b490b6105059228e510f6114231a735435c0c678c450"

  url "https://github.com/kevin-lee/token-watchroo/releases/download/v#{version}/Token-Watchroo-#{version}-#{arch}.dmg"
  name "Token Watchroo"
  desc "Menubar app that watches Claude Code and Codex usage windows"
  homepage "https://github.com/kevin-lee/token-watchroo"

  livecheck do
    skip "Versioned cask; pinned to 0.2.0"
  end

  auto_updates true
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
