cask "ferdium" do
  arch arm: "arm64", intel: "x64"

  version "7.2.1"
  sha256 arm:   "7679d3a280edc7b5a1684afc7c6d34027ad5a2a2983f6e774ff0747974c12b02",
         intel: "ed6f0612b6d027e11b80411f4b1510885fa9aae9a89e927d9bf7233ceb4ffcf0"

  url "https://github.com/ferdium/ferdium-app/releases/download/v#{version}/Ferdium-mac-#{version}-#{arch}.dmg",
      verified: "github.com/ferdium/ferdium-app/"
  name "Ferdium"
  desc "Multi-platform multi-messaging app"
  homepage "https://ferdium.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "ferdium-beta"
  depends_on :macos

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
