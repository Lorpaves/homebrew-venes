cask "venes" do
  version "0.6.0"
  sha256 "4db90e454efde1b2c652c10b38e436222095eff15de1ef19aca2365cf4ea3b8a"

  url "https://github.com/Lorpaves/venes-cli/archive/refs/tags/v#{version}.tar.gz"
  name "Venes CLI"
  desc "Follow and answer Claude Code sessions from the Venes iPhone app"
  homepage "https://github.com/Lorpaves/venes-cli"

  livecheck do
    url :url
    strategy :git
  end

  depends_on formula: "node"

  # Installs the plugin, or brings it up to date on an upgrade, and starts it.
  installer script: {
    executable: "venes-cli-#{version}/install.sh",
  }
  binary "venes-cli-#{version}/bin/venes"

  # A real uninstall takes everything off; an upgrade or a reinstall only stops the helper.
  uninstall script: {
    executable:   "venes-cli-#{version}/scripts/brew-uninstall.sh",
    must_succeed: false,
  }

  zap trash: "~/.venes"

  caveats <<~EOS
    Pair the Venes app with:
      venes pair

    Claude Code sessions that were open before need a restart, or /reload-plugins, to be seen.
  EOS
end
