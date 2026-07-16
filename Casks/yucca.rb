# typed: false
# frozen_string_literal: true

# Source template for the Homebrew cask (the menu-bar app). The release
# workflow substitutes 0.1.3 / 36a3fdeb818661e81cc339fd7442db2d7476eac8d25074ce9b724dfbe1fd0ba2 from the notarized DMG and
# commits the result to kobylinski/homebrew-tap as Casks/yucca.rb.
cask "yucca" do
  version "0.1.3"
  sha256 "36a3fdeb818661e81cc339fd7442db2d7476eac8d25074ce9b724dfbe1fd0ba2"

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
