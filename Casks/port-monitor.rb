cask "port-monitor" do
  version "1.5.0"

  on_arm do
    sha256 "7ef8ac5173e6a32f05ae35976447bcd937dadb3bf18c14437612eae226132b5f"

    url "https://github.com/derenko404/port-monitor-app/releases/download/v#{version}/port-monitor-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "829717db999bed4854fb7afd6cc7c1022a1d49aaec5176406d1f0e923a870afb"

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
