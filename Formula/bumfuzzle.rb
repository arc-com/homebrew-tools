class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.2.4.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "608646004a94b5b8e945f5e1ad9fdcf2d4bb6c5a0cd8085a2e5147a63d588771"
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
