cask "ferdium-nightly" do
  arch arm: "arm64", intel: "x64"

  version "6.2.1-nightly.22"
  sha256 arm:   "58c248ad5532cbc8e10194c0b15a99a4adbccabd23b8f057297ad162adf9f296",
         intel: "6a139b136ee5f0e2f8254efde7e5e78ed4894bdb279f7ea6840318f05867533c"

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
