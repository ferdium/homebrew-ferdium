cask "ferdium-nightly" do
  arch arm: "arm64", intel: "x64"

  version "6.5.3-nightly.3"
  sha256 arm:   "6cdd00acdd99bdece0ef8dd012622f07a532cf763828cd2f546eab28a6a1c527",
         intel: "445ca771f7f64d3177b4f1a475161b13bdf8960ea93df7acc1f9012cbf1374f8"

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
