class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "8200f1f9815e8f0b738c03f3b9b1d9abd9b536a1f1c275737d5198d2c86b793e"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "92138ed8b939d6bab065b8428b0f98110d59a5c74abe50c7c8d99f33d478aef7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "3924af5ba4897b12575569c0f57a2194e7bd6c93e2dd7ff89a17ebeab31757af"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "7b4dec68228c91f83a524390ce34cd7baf57a8a21ede889f84345e7491414152"
    end
  end

  def install
    binary = Dir["bight-*"].first
    bin.install binary => "bight"
    generate_completions_from_executable(bin/"bight", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bight --version")
  end
end
