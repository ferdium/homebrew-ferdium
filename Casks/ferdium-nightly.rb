cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"

  version "6.0.1-nightly.7"

  if Hardware::CPU.intel?
    sha256 "9333227d46954b3f5f35b4a6e3204d3f353be124537aec5dfb02c8c5e8a4be8e"
  else
    sha256 "8019a04c11ff9a864818f4c154c9035907a5e8a7ba0c3ff689a62defdd2d4a87"
  end

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-mac-#{version}-#{arch}.dmg",
      verified: "github.com/ferdium/ferdium-app/"
  name "Ferdium"
  desc "All your services in one place"
  homepage "https://ferdium.org/"

  conflicts_with cask: "ferdium-beta"

  # TODO: Need to turn this on after the in-app updater is verified to work
  # auto_updates true

  app "Ferdium.app"

  uninstall quit:   "com.ferdium.ferdium-app",
            delete: "/Library/Logs/DiagnosticReports/Ferdium Helper_.*wakeups_resource.diag"

  zap trash: [
    "~/Library/Application Support/Caches/ferdium-updater",
    "~/Library/Application Support/Ferdium",
    "~/Library/Caches/com.ferdium.ferdium-app",
    "~/Library/Caches/com.ferdium.ferdium-app.ShipIt",
    "~/Library/Logs/Ferdium",
    "~/Library/Preferences/ByHost/com.ferdium.ferdium-app.ShipIt.*.plist",
    "~/Library/Preferences/com.electron.ferdium.helper.plist",
    "~/Library/Preferences/com.electron.ferdium.plist",
    "~/Library/Preferences/com.ferdium.ferdium-app.plist",
    "~/Library/Saved Application State/com.ferdium.ferdium-app.savedState",
  ]
end
