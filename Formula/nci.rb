class Nci < Formula
  desc "Use the right package manager (Rust port of @antfu/ni)"
  homepage "https://github.com/Debbl/nci"
  version "0.3.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-aarch64-apple-darwin.tar.gz"
      sha256 "5ba8648187812b370564659677d1a995d55cebaf5aef21248e9c7bba4616f454"
    else
      url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-apple-darwin.tar.gz"
      sha256 "5e87ce4a15bedf9e288434a5e0435b8a30ebe50713a97ef0996f41e5881e30d1"
    end
  elsif OS.linux?
    url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3ef26ce3d66a2cf38fb573f50e312e2a7c7314d7bc90d88945b0baaf98eb4972"
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
