class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "b53f9446bc8547f1944d338f4f57b76e83f9d5e8d18ef256dc2377560f84f15b"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "b4c63421971833a2ed48ac688ec7163e1f52eaf4c333ecf94a91b097a0339f69"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
      sha256 "b4c63421971833a2ed48ac688ec7163e1f52eaf4c333ecf94a91b097a0339f69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "b2eb7c543b89af678b96017d481972b6ec84c5769f7c34779ac7c73498eecc7e"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "5fdc309c4d98945cc27a13afdbdae7f3ea228b731ef86809a29c8fcaed6e93a6"
    end
  end

  def install
    odie "ai-skills requires Apple Silicon (ARM64). Intel Macs are not supported." if OS.mac? && Hardware::CPU.intel?

    bin_name = if OS.mac?
      if MacOS.version >= :tahoe
        "aiskills-macos-26-arm64"
      else
        "aiskills-macos-15-arm64"
      end
    elsif OS.linux? && Hardware::CPU.arm?
      "aiskills-linux-arm64"
    else
      "aiskills-linux-x86_64"
    end
    bin.install bin_name => "aiskills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aiskills --version 2>&1")
  end
end
