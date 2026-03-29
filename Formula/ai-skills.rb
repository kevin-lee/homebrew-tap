class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "3123ea85b9c730c35ea47fecaaa3c2f2943b9a40d1675db449fe569b495bc24b"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "c057f96f073994e6841fee25b9d2a000a46e12e85d4574c06722d94c054deada"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
      sha256 "c057f96f073994e6841fee25b9d2a000a46e12e85d4574c06722d94c054deada"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "04dd76a4682d21e8feb95f50a0e496b313c52fdbb7b2f5ccdf07dd23a44b616e"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "1c46b824ef768e316d08c9f18f96a2f4ea4d7cb1a77c3b0d4db976621358e651"
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
