class Nci < Formula
  desc "Use the right package manager (Rust port of @antfu/ni)"
  homepage "https://github.com/Debbl/nci"
  version "0.3.4"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Debbl/nci/releases/download/v0.3.4/nci-aarch64-apple-darwin.tar.gz"
      sha256 "5ba8648187812b370564659677d1a995d55cebaf5aef21248e9c7bba4616f454"
    else
      url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-apple-darwin.tar.gz"
      sha256 "0ec99fb5a9e7740a26c4a938f84813b488232d908126fd6bf24d5c82f8e0740d"
    end
  elsif OS.linux?
    url "https://github.com/Debbl/nci/releases/download/v#{version}/nci-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5bd33c52c290eee3f236ab089c3e91fbaca2601bcc67f2842d125834f5c40270"
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
