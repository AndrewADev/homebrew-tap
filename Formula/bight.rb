class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "v0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "e9f13df532f2bba238a938162969f4140910c81b7e81fa184000a58f8111d4ce"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "d27218f61dcfd1363019a78a78fb264e423f8a12c9b0753912392e21ab828fd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "56ea7ca9905c9d21a9f953e590d1c8747b4089079d2a0d2918b295ea6bafc92f"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "1820129b7d3466c0dfef053db6021cf78f455f6f8e45c107fc726e12262048c1"
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
