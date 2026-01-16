  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.3.7"

    on_intel do
    sha256 "3adcbaa4b3f426a85d3b511ccd68060864e82d225e1ec82d8a113380d57b74f5"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    on_arm do
    sha256 "3a557d759f003a8ed338197f11ad0a56dff1d2804412775c23fdfbf16fe3bbf0"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_aarch64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    name "Conflux"
    desc "Modern proxy management app based on MiHomo"
    homepage "https://github.com/veildawn/conflux-app"

    livecheck do
      url :url
      strategy :github_latest
    end

    app "Conflux.app"

    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-rd", "com.apple.quarantine", "#{appdir}/Conflux.app"],
                     sudo: false
    end

    zap trash: [
      "~/Library/Application Support/com.conflux.desktop",
      "~/Library/Caches/com.conflux.desktop",
      "~/Library/Preferences/com.conflux.desktop.plist",
      "~/Library/Saved Application State/com.conflux.desktop.savedState",
    ]
  end
