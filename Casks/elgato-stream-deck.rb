cask 'elgato-stream-deck' do
  version '4.7.0.12981'
  sha256 'd5221dd91cb73e754b31ede3c7aa4e4e7c3d249962f29f4a86c8c320a378070d'

  url "https://edge.elgato.com/egc/macos/sd/Stream_Deck_#{version}.pkg"
  appcast 'https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://gc-updates.elgato.com/mac/sd-update/final/download-website.php'
  name 'Elgato Stream Deck'
  homepage 'https://www.elgato.com/en/gaming/stream-deck'

  depends_on macos: '>= :sierra'

  pkg "Stream_Deck_#{version}.pkg"

  uninstall launchctl: 'com.elgato.StreamDeck',
            quit:      'com.elgato.StreamDeck',
            pkgutil:   'com.elgato.StreamDeck'

  zap trash: [
               '~/Library/Application Support/com.elgato.StreamDeck',
               '~/Library/Caches/com.elgato.StreamDeck',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data/com.elgato.StreamDeck',
               '~/Library/Preferences/com.elgato.StreamDeck.plist',
             ]
end
