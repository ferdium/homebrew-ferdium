cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"

  version "6.0.0-nightly.30"

  if Hardware::CPU.intel?
    sha256 "7f3a70219c67b8d1b0d697a7f46aa683264b3a2054d71cfed4ebb5284f5b4fcf"
  else
    sha256 "dcc337db781da14a799bf796187a5605e60cc7efb419d5e940a0800528067f43"
  end

  # github.com/ferdium/ferdium-app was verified as official when first introduced to the cask
  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-#{version}#{arch}.dmg"

  name "Ferdium"
  desc "All your services in one place"
  homepage "https://ferdium.org/"

  # TODO: Need to turn this on after the in-app updater is verified to work
  # auto_updates true

  app "Ferdium.app"

  zap trash: [
    "~/Library/Application Support/Ferdium",
    "~/Library/Application Support/Caches/ferdium-updater",
    "~/Library/Saved Application State/org.ferdium.ferdium-app.savedState",
    "~/Library/Preferences/org.ferdium.ferdium-app.plist"
  ]
end
