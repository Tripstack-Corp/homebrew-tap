class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.0.3"
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
      sha256 "5c0193e7f0f8f19e6e18658b813bf3b387416d3e363a118e357b9e584552e336"
    end
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "5c0193e7f0f8f19e6e18658b813bf3b387416d3e363a118e357b9e584552e336"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "c991224be7cb812f1b7012517d03905c49314ec8d5d7e1da14ae458ce75a4099"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "02d7937cd7018f48b673db9d23fd6c6c9f675fd5c1e57beb5ce09e49d50f7c4b"
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
