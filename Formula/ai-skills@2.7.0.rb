class AiSkillsAT270 < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  version "2.7.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-26-arm64"
        sha256 "28fdd7effecb913317abfc7b77e47a303d70ae04a057b7ece1f6c604e2ee74b4"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-arm64"
        sha256 "021ed2b998a73c67349cf847bae13c4cd9972c43b434754244b1497d6f10cb97"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-macos-15-intel"
      sha256 "fb031d327af82d2508d87a33b3eeff0d6fc7f9b13c714f92a8fc477324bc4aca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-arm64"
      sha256 "287083898a3797b2e1fb15ddbcb6a152180173d5d59b709bc90af5636f4c893f"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v#{version}/aiskills-linux-x86_64"
      sha256 "7ec09e20aa9200c3cfa646559b070130434dbc144933711324626fa83dfd15d3"
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
