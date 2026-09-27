class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "7d7f776345698fa99c6290760b4cd39caff2073133d0058570c936aa0a02d1f2"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "733e8500f9ecd07179e73708c861d524b7b2f5af2deb2cfd4d16fa18c889eb5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "47d14f4c7c4a0d35f07a6cceaadcf386f1c20eb55ce8577a7d3813a6e2781de6"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "d072626312477d471e1b436ac9500b9877acd49ff946bdaaa51093cae5b395c7"
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
