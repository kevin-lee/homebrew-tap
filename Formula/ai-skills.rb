class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.8.0/aiskills-macos-26-arm64"
        sha256 "46d5da633ddf7d2b44da13b4adc2b56d57fef2611b4a19328bf1f35ac32cb2f9"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.8.0/aiskills-macos-15-arm64"
        sha256 "0f37eb7648a95c38c370316c9269b57cab910f4b933a14bb6966123553401589"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.8.0/aiskills-macos-15-intel"
      sha256 "d18873e69fc6c179eb7b63382383c3c9e3c02430c89b73e68787b4a359f1b283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.8.0/aiskills-linux-arm64"
      sha256 "5f3264849d4c6fb4a33e712c81eef8b3e35a46c1cac0016fb1751d812128cb1b"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.8.0/aiskills-linux-x86_64"
      sha256 "398f5877d057e1ae5c195c98420098460afe6eedbb35cd8ee1856b639b735dd3"
    end
  end

  def install
    bin_name = if OS.mac?
      if Hardware::CPU.intel?
        "aiskills-macos-15-intel"
      elsif MacOS.version >= :tahoe
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
