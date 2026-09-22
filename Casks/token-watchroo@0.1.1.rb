cask "token-watchroo@0.1.1" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "2c72a20c31cd4b8cf664bfff9f636cb62872ea7533c9469dbdae8c9775fb686b",
         intel: "b8127447a1fbf451538e2e2f5ee8eef573c5c8db67d7169e775ebd5c18a89e51"

  url "https://github.com/kevin-lee/token-watchroo/releases/download/v#{version}/Token-Watchroo-#{version}-#{arch}.dmg"
  name "Token Watchroo"
  desc "Menubar app that watches Claude Code and Codex usage windows"
  homepage "https://github.com/kevin-lee/token-watchroo"

  livecheck do
    skip "Versioned cask; pinned to 0.1.1"
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
