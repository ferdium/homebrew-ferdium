cask "ferdium-nightly" do
  arch arm: "arm64", intel: "x64"

  version "6.2.7-nightly.7"
  sha256 arm:   "301458eb0c096894d660a2e32f1222569ba371622d08bf804dbc29146bd9e96f",
         intel: "7a4bd987889143f1476d566919e2ae0358275986a0123baee411d43cdf5ac7b5"

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-mac-#{version}-#{arch}.dmg",
      verified: "github.com/ferdium/ferdium-app/"
  name "Ferdium"
  desc "Multi-platform multi-messaging app"
  homepage "https://ferdium.org/"

  auto_updates true
  conflicts_with cask: "ferdium-beta"

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
