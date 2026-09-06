class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.10.0/aiskills-macos-26-arm64"
        sha256 "e5ba77a5ff7d9ad18b399dfebb7f20375826c9dc767185f8b1df0d5b61bcfaa8"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.10.0/aiskills-macos-15-arm64"
        sha256 "190525564405fc767669abecb58dc66f92400aeb68ab0638bca7500eddb33d89"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.10.0/aiskills-macos-15-intel"
      sha256 "b1a1a15c6949e750745bb88fe6b70b48702aca6751355febcb93b68882ce6188"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.10.0/aiskills-linux-arm64"
      sha256 "54de090e0dc7ae2310a0301ba75933dff574421d861688a1e3bcc1a19f7c0c4a"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.10.0/aiskills-linux-x86_64"
      sha256 "d6cceee614588389351b6bc86cc2bc22c6860126c72734cd656f26d544d6465a"
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
