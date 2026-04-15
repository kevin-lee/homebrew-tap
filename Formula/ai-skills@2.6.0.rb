class AiSkillsAT260 < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "2.6.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "f44df29f484014396d17e93d016630ba4fec037e7d2b16144333b0b90733c786"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "0abb878b954c6da42278296b6a24979d5c1be984b0fbf55f96dbc31001f46ede"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
      sha256 "0abb878b954c6da42278296b6a24979d5c1be984b0fbf55f96dbc31001f46ede"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "b5fe14830acec07cb66f9eb1e826832633a817e9913031e81f4be86ef71c21a8"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "ca3808d8751eee07486828074b6f403a940058e7228d8e9c6031c93b8e6ed062"
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
