class Bight < Formula
  desc "Patches .env files automatically on git checkout"
  homepage "https://github.com/AndrewADev/bight"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-arm64"
      sha256 "fea3114a19dce9fc3e2ae8f5fb6a0e7bcacf800e594bbb6af3db5f6159325b8a"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-darwin-amd64"
      sha256 "404ade00c8a234208d05fe49394bd7a35c9f8f7441bd6bf7281fd55f3eb6f99b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-arm64"
      sha256 "89c3aa0ea91006e2166650a297411bf6654f569dbbea8712bab2a30ad25d65dd"
    end
    on_intel do
      url "https://github.com/AndrewADev/bight/releases/download/v#{version}/bight-linux-amd64"
      sha256 "b258675a90873d3bdf641320515bf97d1a5ad183fbd7cb1b4e1432f6a0a9bb91"
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
