cask "port-monitor" do
  version "1.1.2"

  on_arm do
    sha256 "c27218fb3f2ebc879dbc8d18989b0ca04d16d30745b53a006d91bd607a545b64"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "c80179afe0b5e97c5731539da1a1d18eb4d23808c4a2131d5b056362da39ed12"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-x64.dmg"
  end

  name "Port Monitor"
  desc "Menubar app to see and kill what's listening on your ports"
  homepage "https://github.com/derenko404/port-monitor-app"

  depends_on :macos

  app "Port Monitor.app"

  zap trash: "~/Library/Application Support/port-monitor"

  caveats <<~EOS
    Port Monitor is ad-hoc signed but not notarized. On first launch macOS may block it.
    Right-click the app in /Applications and choose Open, or reinstall with:
      brew install --cask --no-quarantine port-monitor
  EOS
end
