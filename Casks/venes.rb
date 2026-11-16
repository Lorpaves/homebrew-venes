cask "venes" do
  version "0.26.0"
  sha256 "c08f2beda27bf39ea8b3001a4a6515577d245797b3639da311d46e3f15a64791"

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
