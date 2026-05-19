class Nci < Formula
  desc "Use the right package manager (Rust port of @antfu/ni)"
  homepage "https://github.com/Debbl/nci"
  version "0.3.5"
  license "MIT"

  # Each sha256 carries a `# <asset-filename>` marker so the release workflow
  # in Debbl/nci can locate which `.sha256` sidecar maps to which line. To
  # add a new target, just add another url/sha256 pair with the matching
  # marker — no workflow changes needed.
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-aarch64-apple-darwin.tar.gz"
      sha256 "57658015485140837b6cbe5b09b8e8d10babd058e8fe9737bfeed40251a81745" # nci-aarch64-apple-darwin.tar.gz
    else
      url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-apple-darwin.tar.gz"
      sha256 "1df57fa65f76e397e611717564ee08bdcdc0e135c9c87c4e52d11c9fee156227" # nci-x86_64-apple-darwin.tar.gz
    end
  elsif OS.linux?
    url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b4688b71768a584f4c517681bf5850f530408437d9a213ead8b209e14ac3c28" # nci-x86_64-unknown-linux-gnu.tar.gz
  end

  def install
    # All nine binaries ship in the same archive — install them all.
    bin.install "ni", "nr", "nci", "na", "nlx", "nu", "nup", "nun", "nd"
  end

  test do
    # `--agent` exits 0 even with no lockfile (prints "unknown"). Any of the
    # binaries works for a smoke test since they all dispatch through the
    # same runner.
    assert_match(/[a-z]+/, shell_output("#{bin}/ni --agent"))
  end
end
