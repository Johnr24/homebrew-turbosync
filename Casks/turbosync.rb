cask "turbosync" do
  version "1.4.11"
  sha256 "1c562def073d4e921f6da7ec6ec0be7177177f90cd2c7f30dbf213da14eaa2f6"

  url "https://github.com/Johnr24/TurboSync/releases/download/v#{version}/TurboSync-v#{version}.dmg",
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