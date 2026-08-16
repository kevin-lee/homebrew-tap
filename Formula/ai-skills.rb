class AiSkills < Formula
  desc "CLI tool for managing AI coding agent skills across multiple agents"
  homepage "https://github.com/kevin-lee/ai-skills"
  license "MIT"

  on_macos do
    on_arm do
      on_tahoe :or_newer do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.9.0/aiskills-macos-26-arm64"
        sha256 "90ffac873fbb32b172fe5b8089e906a247b4dea5a618ffd44d6c0ffb627029b0"
      end
      on_sequoia :or_older do
        url "https://github.com/kevin-lee/ai-skills/releases/download/v2.9.0/aiskills-macos-15-arm64"
        sha256 "11fdce777def2e3b5865f130e2df37077264fcc7c85697b93e6acb20b5368387"
      end
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.9.0/aiskills-macos-15-intel"
      sha256 "34b76315025117f7cf589843631a470c823f065685435d51d35ae1b423b4205a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.9.0/aiskills-linux-arm64"
      sha256 "fcf9f41dd82787ddecbe332ab5b79728caffa278bffe84d2c20efd1c28d24fbb"
    end
    on_intel do
      url "https://github.com/kevin-lee/ai-skills/releases/download/v2.9.0/aiskills-linux-x86_64"
      sha256 "d83456515323cf33cd79756eed9283f4be958e7698fb256f59f97410112b2783"
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
