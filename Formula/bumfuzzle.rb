class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.2.6.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "fc9c3796c3d3caaf244ab0e0d9216b31642c6bf35ac85414f67ffe254cab1d46"
  license "MIT"

  depends_on "yq"
  depends_on "python@3.12"

  def install
    libexec.install "bumfuzzle.sh", "eval-rules.sh", "bumfuzzle-template.yml", "index.html", "scripts", "VERSION"
    bin.install_symlink libexec/"bumfuzzle.sh" => "bumfuzzle"
    bin.install_symlink libexec/"bumfuzzle.sh" => "bf"
  end

  test do
    system bin/"bumfuzzle", "--help"
  end
end
