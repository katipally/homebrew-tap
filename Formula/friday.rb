# Homebrew formula for Friday Code.
#
# Lives in a tap repo (e.g. github.com/katipally/homebrew-tap as Formula/friday.rb).
# `version` and the four `sha256` values are updated by the release workflow on each
# tagged release; `brew install katipally/tap/friday` then fetches the right binary.
class Friday < Formula
  desc "Terminal AI coding agent — animated TUI, multi-provider, tool-calling"
  homepage "https://github.com/katipally/friday-code"
  version "2.0.11" # rendered from the release tag at publish time
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-arm64"
      sha256 "86a0f5623c9890dfde43a1f0de221e52f17a1d97f4ae7c7bd4d20b2e7fa8b3a7"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-x64"
      sha256 "9826633f9ee7c910fe9d4bf2be7710e16539f3b0c54bec4c855f7f9ff1ed9eda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-arm64"
      sha256 "306dad0db8e43a1da280798f742dbf029eab0161537485016081abaf3491173c"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-x64"
      sha256 "d3e9679ccbe725af873bcee120b76444ebebf5a933fc421451d3d052f7039afa"
    end
  end

  def install
    bin.install Dir["*"].first => "friday"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/friday --version")
  end
end
