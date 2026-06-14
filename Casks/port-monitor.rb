cask "port-monitor" do
  version "1.1.3"

  on_arm do
    sha256 "bc8bb270b7896e580949fb7a7923fbd7aaa067ffee3dc183623a9d651bb29dcc"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "b456f4651b6c61466c5cc3be88c5e595afb99bd9808ebce3dd34dec8fdde4fe4"

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
