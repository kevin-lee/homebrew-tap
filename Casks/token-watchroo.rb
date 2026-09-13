cask "token-watchroo" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "347b63d3328561d6ea2739ae51533f5e8506b3f60aef81a432b62f0d264ba667",
         intel: "939f2a9d869fb84d5f01b04da4ef8db90aa0df2b55ebc60680cc329a42972daa"

  url "https://github.com/kevin-lee/token-watchroo/releases/download/v#{version}/Token-Watchroo-#{version}-#{arch}.dmg"
  name "Token Watchroo"
  desc "Menubar app that watches Claude Code and Codex usage windows"
  homepage "https://github.com/kevin-lee/token-watchroo"

  livecheck do
    url :url
    strategy :github_latest
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
