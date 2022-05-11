cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"

  version "6.0.0-nightly.32"

  if Hardware::CPU.intel?
    sha256 "3c6514c56e81b3f71d0c106fffa38693e5500a97024f8ecd9209ebf525de0ca7"
  else
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
