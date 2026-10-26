class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.3.0"
  license "BSD-3-Clause"

  # `brew install --HEAD spyc` builds the CURRENT stream (main) from source.
  head do
    url "https://github.com/Tripstack-Corp/spyc.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    # One universal binary (arm64 + x86_64) serves both Macs. Both arch blocks
    # name it because `on_macos` itself may not carry a url/sha256 (brew audit).
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "2b071583e62295d0b151d851054a51d9d9e4be810a7863f8bebeae6fc630b041"
    end
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "2b071583e62295d0b151d851054a51d9d9e4be810a7863f8bebeae6fc630b041"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "c22c7afbc37fe7b3e359ee5e0760e8e713abd20d4b5fd4e229f6bc32de90f701"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "83658a67b47103b0d159a78f78d01b62545ee3f0abcff6a41af5f0aad279738f"
    end
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "spyc"
    end
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/spyc --version"))
  end
end
