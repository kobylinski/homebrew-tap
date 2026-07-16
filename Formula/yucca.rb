# typed: false
# frozen_string_literal: true

# Source template for the Homebrew formula (the `yucca` CLI). The release
# workflow fills 0.1.3 and the per-platform __SHA_*__ from the release
# checksums, then commits the result to kobylinski/homebrew-tap as
# Formula/yucca.rb.
class Yucca < Formula
  desc "Local secret management for AI coding assistants"
  homepage "https://github.com/kobylinski/yucca"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_arm64.tar.gz"
      sha256 "daf4c96bc89c39d12fc271600d94e8ee89691645511b1b9a2af6f593c8906daf"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_amd64.tar.gz"
      sha256 "5969badb36181a3e84c0fd62e854e915f0cabf71e2c5a812daea62c1729c85e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_arm64.tar.gz"
      sha256 "6d02456365a08dfc2828afe1d07c739a02c251459adb46edaa705526c248eda8"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_amd64.tar.gz"
      sha256 "5a27c8f9001e06d55efd23d8144c0b0dd739df42a6a0e74db36a87d04509cb7c"
    end
  end

  def install
    bin.install "yucca"
  end

  service do
    run [opt_bin/"yucca", "daemon", "--idle-timeout", "0"]
    keep_alive true
    log_path var/"log/yucca.log"
    error_log_path var/"log/yucca.log"
  end

  def caveats
    <<~EOS
      Start the Yucca daemon (launchd-managed — auto-start at login, auto-restart):
        brew services start yucca

      Then register a project:
        cd your-project && yucca init
    EOS
  end

  test do
    system "#{bin}/yucca", "version"
  end
end
