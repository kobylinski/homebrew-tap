# typed: false
# frozen_string_literal: true

# Source template for the Homebrew formula (the `yucca` CLI). The release
# workflow fills 0.1.4 and the per-platform __SHA_*__ from the release
# checksums, then commits the result to kobylinski/homebrew-tap as
# Formula/yucca.rb.
class Yucca < Formula
  desc "Local secret management for AI coding assistants"
  homepage "https://github.com/kobylinski/yucca"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_arm64.tar.gz"
      sha256 "8a5be9c499a0dc4147a278ad0d318fdcc077948c7e781cf73b8f225c3da6fa9d"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_amd64.tar.gz"
      sha256 "034ac2c77253d9a7bf1916ffef4847a0a1852963e0140fdd0bde321d5e96f375"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_arm64.tar.gz"
      sha256 "c89ab4bd14a91b544f8257f0795511abe95ac0dfdeee82b5eba5dbd3721ba418"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_amd64.tar.gz"
      sha256 "5050d10523657114f15d9ce0d5a338911dd7ec4f00aaad44261f2082b41c7eb2"
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
