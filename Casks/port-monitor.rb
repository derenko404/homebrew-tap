cask "port-monitor" do
  version "1.4.0"

  on_arm do
    sha256 "c2b9657ddd3c0abda217b807ccad4ca1d0c26209f7b1c677d2870a6c4ff43ebc"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "94fed2f6e81dc254031520ad5290a4c6a6e2fc74b4f009bea8572bb3dfc270bc"

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
