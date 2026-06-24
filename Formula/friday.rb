# Homebrew formula for Friday Code.
#
# Lives in a tap repo (e.g. github.com/katipally/homebrew-tap as Formula/friday.rb).
# `version` and the four `sha256` values are updated by the release workflow on each
# tagged release; `brew install katipally/tap/friday` then fetches the right binary.
class Friday < Formula
  desc "Terminal AI coding agent — animated TUI, multi-provider, tool-calling"
  homepage "https://github.com/katipally/friday-code"
  version "2.0.12" # rendered from the release tag at publish time
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-arm64"
      sha256 "4f004f3d7176eb33c2903c191063973f985729bd434892ed008e66cc630812ba"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-darwin-x64"
      sha256 "087ca66f6414bd02a11e1ea1b9e38dc0459fbb0f1ce00e9d97b7f23bc941d249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-arm64"
      sha256 "a5a66685dd9c9251ea431d3a9ae269ee49bfb3dcf4dd066a48b8bccece4ced17"
    end
    on_intel do
      url "https://github.com/katipally/friday-code/releases/download/v#{version}/friday-linux-x64"
      sha256 "4f110f9e9bc2d33482f88a5513100b1e7999ab79d4c90f4b562ef6b3062ba5ec"
    end
  end

  def install
    bin.install Dir["*"].first => "friday"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/friday --version")
  end
end
