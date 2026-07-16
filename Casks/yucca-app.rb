# typed: false
# frozen_string_literal: true

# Source template for the Homebrew cask (the menu-bar app). The release
# workflow substitutes 0.1.4 / 8fd8ec4afc471e87061dcb6be8b98986795321936b66db95a7152163dbbc31f2 from the notarized DMG and
# commits the result to kobylinski/homebrew-tap as Casks/yucca-app.rb.
#
# Token is "yucca-app", NOT "yucca": a cask and formula sharing one token makes
# Homebrew skip linking the formula binary on upgrade ("yucca cask is installed,
# skipping link"), dropping `yucca` off PATH. Keeping the CLI formula as "yucca"
# (what `brew install yucca` gets) and the app cask as "yucca-app" avoids that.
cask "yucca-app" do
  version "0.1.4"
  sha256 "8fd8ec4afc471e87061dcb6be8b98986795321936b66db95a7152163dbbc31f2"

  url "https://github.com/kobylinski/yucca/releases/download/v#{version}/Yucca-#{version}.dmg"
  name "Yucca"
  desc "Menu-bar companion for the yucca secret manager"
  homepage "https://github.com/kobylinski/yucca"

  # The tray talks to the daemon shipped by the CLI formula.
  depends_on formula: "kobylinski/tap/yucca"

  app "Yucca.app"

  # App-only state; the CLI/formula owns ~/.yucca, so don't trash it here.
  zap trash: "~/Library/Preferences/co.kobylinski.yucca.plist"
end
