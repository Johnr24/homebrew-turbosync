# Formula: turbosync.rb
class Turbosync < Formula
  desc "A macOS utility for synchronizing directories using rsync."
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.4.4/TurboSync-v1.4.4.dmg"
  sha256 "e10fe57c6715c5839db4a9bbc35a89efae5005b8f6274a2b682967d7b29b626f"
  version "1.4.4"

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
