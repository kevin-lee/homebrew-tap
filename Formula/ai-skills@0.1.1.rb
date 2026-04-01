class AiSkillsAT011 < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "0.1.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "657942e2b715d7c484ab1d30f17b7b4751e5e4ee96da68f9123adc6b4c8df322"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "2e5d7ff235d01a1888e25c0cccd0da857e75e7c452475b683dcfa25c7158d82d"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
      sha256 "2e5d7ff235d01a1888e25c0cccd0da857e75e7c452475b683dcfa25c7158d82d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "d3a64d2dac85cee2503ddb95ef908a434ecd852c7fddca7e8a6c2e1c3212fd31"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "3b38045da7e283d40b67a06219f3e738a9e3a04276bc18d140a70e68d612225c"
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
