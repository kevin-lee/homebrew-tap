class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.11.0/aiskills-macos-26-arm64"
        sha256 "2212766bd1ca713912c41bf95ba7b9bd4d3dc251ad535705dcafc07cd80b75c2"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.11.0/aiskills-macos-15-arm64"
        sha256 "f6bf075e41e01b872015786cde2f3338fbe4483156ae45fe9ad40adc1fabd5eb"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.11.0/aiskills-macos-15-intel"
      sha256 "31c40830852dc738b28956519a5ca81c9eab7ff5f004c7c3db8f473271b0bd90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.11.0/aiskills-linux-arm64"
      sha256 "21b4d6b43c68ac44a7b51f3c1c5e0d6df25532256158b7c0d4c599120edd4257"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.11.0/aiskills-linux-x86_64"
      sha256 "8dccd9fec98aeb5d6dcdab81ccc52b25ae043ec32f8b34c38d7fd83f85fc02f9"
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
