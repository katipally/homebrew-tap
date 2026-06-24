# Homebrew formula for Friday Code.
#
# Lives in a tap repo (e.g. github.com/katipally/homebrew-tap as Formula/friday.rb).
# `version` and the four `sha256` values are updated by the release workflow on each
# tagged release; `brew install katipally/tap/friday` then fetches the right binary.
class Friday < Formula
  desc "Terminal AI coding agent — animated TUI, multi-provider, tool-calling"
  homepage "https://github.com/katipally/friday-code"
  version "2.0.14" # rendered from the release tag at publish time
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-arm64"
      sha256 "58a07b7d8f9f64c4fd4431650126c0904f8aedeb668f803d0ea89fc07a514546"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-x64"
      sha256 "75a736bf6cf78b211b22a454a89f944199ccfa89aa0b8df46d3042054fb0d2b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-arm64"
      sha256 "403968f47722385f6a74dce545ade4729964d79b53379e36e5556b9d5f934e35"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-x64"
      sha256 "039f9eafaa779ac99c3a50b4f34dc1b52d1043bc8272318ffca78b8eadb97f0a"
    end
  end

  def install
    bin.install Dir["*"].first => "friday"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/friday --version")
  end
end
