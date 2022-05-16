cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"

  version "6.0.0-nightly.37"

  if Hardware::CPU.intel?
    sha256 "ca7e1be37075e0399124af4f1de2c182f3879eaff69aa729b7f9fa64fe4c68d4"
  else
    sha256 "11c9a3451fc68f88f4f340936ccb4d3b57612eb6b809eeb298e02f881f663022"
  end

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-#{version}#{arch}.dmg",
      verified: "github.com/ferdium/ferdium-app/"

  name "Ferdium"
  desc "All your services in one place"
  homepage "https://ferdium.org/"

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
