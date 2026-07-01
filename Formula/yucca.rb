# typed: false
# frozen_string_literal: true

# Source template for the Homebrew formula (the `yucca` CLI). The release
# workflow fills 0.1.1 and the per-platform __SHA_*__ from the release
# checksums, then commits the result to kobylinski/homebrew-tap as
# Formula/yucca.rb.
class Yucca < Formula
  desc "Local secret management for AI coding assistants"
  homepage "https://github.com/kobylinski/yucca"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_arm64.tar.gz"
      sha256 "030c0363740e0d7e54d919d1890d2339b1b9e89397b134a4d5988e09fecd9de4"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_amd64.tar.gz"
      sha256 "ed7faaed978d19f10510e991a3bfc20ff53ccb3943c34f0d8dcbc352926c3b5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_arm64.tar.gz"
      sha256 "6900bd632ef389ed63c31c41a9634efd93a7fe9cb861c75216e753e801a04acb"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_amd64.tar.gz"
      sha256 "28021aede400f4739d6b1ae3dada098e6e24e00a59999d27bcd04258221922e8"
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
