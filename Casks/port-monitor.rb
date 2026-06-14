cask "port-monitor" do
  version "1.2.0"

  on_arm do
    sha256 "8cb411f7c7e056fb54cd038176bc914582f884c07913d84ae567a43a53b302f7"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "c931a4a1e1337b79b3836ed257e3ad1f05f1766526387679714e2a54f85f143d"

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
