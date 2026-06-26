cask "reed" do
  version "0.1.1"
  sha256 "511962eb73b4ebc158601c4c829eb032ac80b2d0371d90f07e4c0ab6e31ee233"

  url "https://github.com/kobylinski/reed/releases/download/v#{version}/Reed.zip"
  name "Reed"
  desc "Native macOS menu-bar player for SoundCloud"
  homepage "https://github.com/kobylinski/reed"

  app "Reed.app"

  # Ad-hoc signed (Developer ID notarization coming). Strip the quarantine flag
  # so Reed opens straight away, no Gatekeeper right-click needed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Reed.app"]
  end

  zap trash: [
    "~/.config/reed",
    "~/Library/Application Support/reed",
  ]
end
