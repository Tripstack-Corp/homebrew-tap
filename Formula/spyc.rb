class Spyc < Formula
  desc "Keyboard-driven, MCP-native terminal file commander"
  homepage "https://github.com/Tripstack-Corp/spyc"
  version "2.3.0-rc.1"
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
      sha256 "1519cf7da6340dca2f633a77aca1ceb450ae74ba1ab8868ac16a45bddfb09683"
    end
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-macos-universal.tar.gz"
      sha256 "1519cf7da6340dca2f633a77aca1ceb450ae74ba1ab8868ac16a45bddfb09683"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-x86_64.tar.gz"
      sha256 "5db81e59d0d0612d0b6c12e8d85031cd3dc490b90f41e3c737cd096db3033abf"
    end
    on_arm do
      url "https://github.com/Tripstack-Corp/spyc/releases/download/v#{version}/spyc-v#{version}-linux-aarch64.tar.gz"
      sha256 "db35057161d8ceca4d1ccc87a3fe31d043e1cfe36a424d1e889f6fb86469562f"
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
