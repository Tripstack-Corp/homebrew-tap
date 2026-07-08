class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.0.0-rc.23"
  license "BSD-3-Clause"

  on_macos do
    # Universal binary (arm64 + x86_64), so one asset serves both Macs.
    url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
    sha256 "ffb4a41403c40b65fba8aead997ac85035be1a5c7dee45ad6d56875b8585149e"
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "0c255b80a69283d9616c04edb9605902d067a73683c4c6e55cf9999e30ce5eeb"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "e8930cdb7a07abd49ee7585fb65d1b06f95b6ab939d8026c979cf5eba455ffd4"
    end
  end

  # `brew install --HEAD spyc` builds the CURRENT stream (main) from source.
  head do
    url "https://github.com/Tripstack-Corp/spyc.git", branch: "main"
    depends_on "rust" => :build
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
