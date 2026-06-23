# Homebrew formula for Friday Code.
#
# Lives in a tap repo (e.g. github.com/katipally/homebrew-tap as Formula/friday.rb).
# `version` and the four `sha256` values are updated by the release workflow on each
# tagged release; `brew install katipally/tap/friday` then fetches the right binary.
class Friday < Formula
  desc "Terminal AI coding agent — animated TUI, multi-provider, tool-calling"
  homepage "https://github.com/katipally/friday-code"
  version "2.0.10" # rendered from the release tag at publish time
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-arm64"
      sha256 "d387e4e72fd432a9da9979118f64e992252eaca2f53172da8cda084ad838b22a"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-x64"
      sha256 "b8b470c5ceb7b1634e8dfff247f9935b3c8bba9d38d8eef74209c42209021e78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-arm64"
      sha256 "893f02cddd19c46c31ef46908601cccb812f6274faf98202aaff7db1d60ab9e8"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-x64"
      sha256 "57694acd1d0deb495e595fb745ed49d2031a75e92372211f78d9a2c85711b5bd"
    end
  end

  def install
    bin.install Dir["*"].first => "friday"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/friday --version")
  end
end
