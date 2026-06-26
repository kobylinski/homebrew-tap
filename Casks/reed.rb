cask "reed" do
  version "0.1.1"
  sha256 "511962eb73b4ebc158601c4c829eb032ac80b2d0371d90f07e4c0ab6e31ee233"

  url "https://github.com/kobylinski/reed/releases/download/v#{version}/Reed.zip"
  name "Reed"
  desc "Native macOS menu-bar player for SoundCloud"
  homepage "https://github.com/kobylinski/reed"

  app "Reed.app"

  caveats <<~CAVEAT
    Reed is ad-hoc signed (Developer ID notarization is on the way). On first
    launch, right-click Reed in Applications -> Open -> Open to get past Gatekeeper.
  CAVEAT

  zap trash: [
    "~/.config/reed",
    "~/Library/Application Support/reed",
  ]
end
