class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "13006ec30f4274f139f6d7e80e006b9d84b413b742b7b3e02a4ff600536bffbb"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "9a03d1d060ada7e236124893912acf9e91e07573f267b0c84c0347b0d86c3d92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "1d3a7a858c64bea8e8b4af3691ae4cac340ab31f9ecddec12fc2b283f8fff235"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "5d61a9a2d4254f921a6d41272c10c8c99b48e83f1c9b5ac54ffc3badd5555a3d"
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
