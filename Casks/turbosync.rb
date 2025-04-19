cask "turbosync" do
  version "3.0.2"
  sha256 "0ac76e449a1845c2ba53152f1cd814d214da9558120663c147fd929a46a1e8d9"

  url "https://github.com/Johnr24/TurboSync/releases/download/v3.0.2/TurboSync-v3.0.2.dmg",
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