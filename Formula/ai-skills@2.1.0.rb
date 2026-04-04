class AiSkillsAT210 < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "2.1.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "9c4cc7b445dafe3a7995b9f9cbd9080febe069ca1aa3d2309f14430274081e1a"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "c8105be5e8deb13c7ebb716cf2703d7170c1211116f67bd29186917da6630510"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
      sha256 "c8105be5e8deb13c7ebb716cf2703d7170c1211116f67bd29186917da6630510"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "65397521cf489fab07cbc00bd1cd3496aaabff43a17757af82c5d56a9ac2488f"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "2ff28eaddc7d3de6460e97abcbb4287b4d221cd43fa49e1e6484c9d6f4eacb5d"
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
