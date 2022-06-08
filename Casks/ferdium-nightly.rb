cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"

  version "6.0.0-nightly.54"

  if Hardware::CPU.intel?
    sha256 "EAEDE099A49132ACCBEAB59F108CB21F5E750A3ACF3D8169D5559F538BCC9259"
  else
    sha256 "C6AB4371101B94780DF566273DB6EDE6F926B16440F57562C1869A23695FA0AB"
  end

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-#{version}#{arch}.dmg",
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
