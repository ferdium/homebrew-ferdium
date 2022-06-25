cask "ferdium-beta" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"

  version "6.0.0-beta.2"

  if Hardware::CPU.intel?
    sha256 "edd6cac303447c845d31de42a70f4f13390f6d809b290ad11a7521ae5d8535bb"
  else
    sha256 "e94a6575e34830b78647d76c3bfdc0f1a06d28ee7b9bba3f464698ed4e425d78"
  end

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-#{version}#{arch}.dmg",
      verified: "github.com/ferdium/ferdium-app/"

  name "Ferdium"
  desc "All your services in one place"
  homepage "https://ferdium.org/"
  conflicts_with cask: "ferdium-nightly"

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
