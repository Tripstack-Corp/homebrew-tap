class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.4.0-rc.1"
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
      sha256 "cac088fef949dd42840b617764546bd2ea9a1896b8b132961c40e47b50d8a743"
    end
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "cac088fef949dd42840b617764546bd2ea9a1896b8b132961c40e47b50d8a743"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "91250c27f66adfe556c7bc8fb2ba36e0f2f8d39c8c508dcb51e44da7cd2b0ed6"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "6e417ff38c4b9f0631015bd039a7337fcfc3ce9162985814c6539f425d549f78"
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
