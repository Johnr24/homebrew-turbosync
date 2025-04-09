cask "turbosync" do
  version "1.5.1"
  sha256 "a6e7ae6cf93863dcc1bc6497e40d482cfd80885c3f156741b3729f8c80f567c2"

  url "https://github.com/Johnr24/TurboSync/releases/download/v1.5.1/TurboSync-v1.5.1.dmg",
      verified: "github.com/Johnr24/TurboSync/"
  name "TurboSync"
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync" # Using the homepage from the previous formula

  # Assuming TurboSync.app is directly inside the DMG root
  app "TurboSync.app"

  # Add minimum macOS requirement if known, e.g.:
  # depends_on macos: ">= :catalina"

  # Optional: Add zap stanza for uninstall cleanup if needed
  # zap trash: [
  #   "~/Library/Application Support/TurboSync",
  #   "~/Library/Preferences/com.yourcompany.turbosync.plist", # Adjust identifier
  # ]
end