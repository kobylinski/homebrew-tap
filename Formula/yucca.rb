# typed: false
# frozen_string_literal: true

# Source template for the Homebrew formula (the `yucca` CLI). The release
# workflow fills 0.1.0 and the per-platform __SHA_*__ from the release
# checksums, then commits the result to kobylinski/homebrew-tap as
# Formula/yucca.rb.
class Yucca < Formula
  desc "Local secret management for AI coding assistants"
  homepage "https://github.com/kobylinski/yucca"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_arm64.tar.gz"
      sha256 "ec1e7877a6ee826c4cfd19fcb913c02b013bb5d398e5e16b9df91199c951c9b4"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_darwin_amd64.tar.gz"
      sha256 "2785950f0bfe8af3c816418ae568017da4066816da6b76b3a81a1e05d958ef5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_arm64.tar.gz"
      sha256 "2a5aadc909eba658e0d7dfbf9d957b6adfe18461af5c1cc92003ac2a903c7c58"
    end
    on_intel do
      url "https://github.com/kobylinski/yucca/releases/download/v#{version}/yucca_#{version}_linux_amd64.tar.gz"
      sha256 "205ec938e7cdcafdcbd201df8c13605d21d985ba5ec56a9fb8b9eb1fb5201726"
    end
  end

  def install
    bin.install "yucca"
  end

  test do
    system "#{bin}/yucca", "version"
  end
end
