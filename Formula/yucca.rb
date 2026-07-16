# typed: false
# frozen_string_literal: true

# Source template for the Homebrew formula (the `yucca` CLI). The release
# workflow fills 0.1.2 and the per-platform __SHA_*__ from the release
# checksums, then commits the result to kobylinski/homebrew-tap as
# Formula/yucca.rb.
class Yucca < Formula
  desc "Local secret management for AI coding assistants"
  homepage "https://github.com/kobylinski/yucca"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_arm64.tar.gz"
      sha256 "d573324ac0b93909743400f1b5759322c67efe25bf384a6e8369c7190b91f16f"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_amd64.tar.gz"
      sha256 "84bb1c4fe6bef35ee2780d66b3606f4832584186199a53512f77efdafc0567bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_arm64.tar.gz"
      sha256 "cf6c52da1f381589f21257e027ab0e389b91fe5822d6dca77b4486ddef494874"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_amd64.tar.gz"
      sha256 "94366674767933fddfc97b1b33f170b7c6ddc07a4f961e896660bd8e002b286b"
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
