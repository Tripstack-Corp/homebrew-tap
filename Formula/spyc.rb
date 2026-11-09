class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.4.0-rc.3"
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
      sha256 "274b932f4b040484f2a7d02c73f296a7bf99df3806eb7b149fb4a417622ae0b6"
    end
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "274b932f4b040484f2a7d02c73f296a7bf99df3806eb7b149fb4a417622ae0b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "42c91e0eaf43085bb5a5733429e9a502f39d8ca15fd59c1e4ae32628475dff0a"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "72f634045006305073e7337f08c11df3544769297a54b5534b63b81ee2bc54b2"
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
