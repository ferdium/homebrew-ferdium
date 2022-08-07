cask "ferdium-nightly" do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"

  version "6.0.1-nightly.11"

  if Hardware::CPU.intel?
    sha256 "b69a17103002e57a6c5057ce341a639bce5d067e5c69f9dc6f82a813b8b9b1b9"
  else
    sha256 "2777375e9cf1a9a4064f7837e7c0639129c984928dc6eb93bf823f213ce2b152"
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
