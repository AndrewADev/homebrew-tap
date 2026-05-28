class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "8994acf7810cef11631f1f2f9313bd1666f839df833c381b1dc7396682f5cc1b"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "f7c3664f1dea574809ffdeea8d7812ab7a2f8567aac2f5b4b83efd30c099ae8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "064872e923d2d3c57013d51e4d2a7a10e540662768bcd2976f5a703ac898dc79"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "b47f4a041f01085733953011808c2b8149fc3a7fff4b8b22726122e4efa208a4"
    end
  end

  def install
    binary = Dir["bight-*"].first
    chmod "+x", binary
    bin.install binary => "bight"
    generate_completions_from_executable(bin/"bight", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bight --version")
  end
end
