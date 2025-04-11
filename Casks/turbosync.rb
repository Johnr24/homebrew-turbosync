cask "turbosync" do
  version "1.6.6"
  sha256 "782e4e0352f18486fba7242841ba06f33b72c5539b8a58c0b75821dc04191612"

  url "https://github.com/Johnr24/TurboSync/releases/download/v1.6.6/TurboSync-v1.6.6.dmg",
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