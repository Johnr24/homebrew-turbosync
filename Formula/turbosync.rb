# Formula: turbosync.rb
class Turbosync < Formula
  desc "A macOS utility for synchronizing directories using rsync."
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.3.1/TurboSync-v1.3.1.zip"
  sha256 "bf28112606cb73441ba1f0a9328fab432bcff99bae18ed6b17d218558ee3ca22"
  version "1.3.1"

  depends_on :macos

  def install
    # The zip file should contain TurboSync.app at the root.
    # Homebrew automatically extracts the zip into the current working directory.
    prefix.install "TurboSync.app"
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
    assert_predicate opt_prefix/"TurboSync.app", :exist?
  end
end
