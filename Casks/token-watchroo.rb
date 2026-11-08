cask "token-watchroo" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "d9cfa332dbf2e60f92fcabc8c77454a7278836f531e7ebd69aafa55de5fb4480",
         intel: "4b87d21dd74eb6b502611855a177efd917ecb91e4e72dea09d80f4dac4f0584d"

  url "https://github.com/kevin-lee/token-watchroo/releases/download/v#{version}/Token-Watchroo-#{version}-#{arch}.dmg"
  name "Token Watchroo"
  desc "Menubar app that watches Claude Code and Codex usage windows"
  homepage "https://github.com/kevin-lee/token-watchroo"

  livecheck do
    url :url
    strategy :github_latest
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
