# Formula: turbosync.rb
class Turbosync < Formula
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.4.11/TurboSync-v1.4.11.dmg"
  version "1.4.11"
  sha256 "1c562def073d4e921f6da7ec6ec0be7177177f90cd2c7f30dbf213da14eaa2f6"

  depends_on :macos

  def install
    # Mount the DMG, copy the app, and unmount
    dmg_path = "TurboSync-v#{version}.dmg" # Match the actual filename from the URL
    mount_point = "/Volumes/TurboSync v#{version}" # Assuming volume name pattern

    # Debug: List files in the current directory
    system "ls", "-la"

    system "hdiutil", "attach", "-nobrowse", dmg_path
    prefix.install Dir["#{mount_point}/TurboSync.app"].first
    system "hdiutil", "detach", mount_point
  end

  def caveats
    <<~EOS
      TurboSync.app has been installed to:
        #{opt_prefix}/TurboSync.app

      To make it easily accessible from your Applications folder, you can link it:
        ln -sfn "#{opt_prefix}/TurboSync.app" /Applications/TurboSync.app

      Alternatively, you can drag the TurboSync.app icon from the installation directory
      (open "#{opt_prefix}") to your /Applications folder.
    EOS
  end

  test do
    # Check if the .app bundle exists in the installation directory
    assert_path_exists opt_prefix/"TurboSync.app"
  end
end
