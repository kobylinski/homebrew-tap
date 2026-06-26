cask "reed" do
  version "0.1.1"
  sha256 "511962eb73b4ebc158601c4c829eb032ac80b2d0371d90f07e4c0ab6e31ee233"

  url "https://github.com/kobylinski/reed/releases/download/v#{version}/Reed.zip"
  name "Reed"
  desc "Native macOS menu-bar player for SoundCloud"
  homepage "https://github.com/kobylinski/reed"

  app "Reed.app"

  caveats <<~CAVEAT
    Reed is ad-hoc signed (not yet notarized), so Gatekeeper blocks it on first run.
    Open it once with:
      Right-click Reed.app in Applications -> Open -> Open
    or clear the quarantine flag:
      xattr -dr com.apple.quarantine "#{appdir}/Reed.app"
  CAVEAT
end
