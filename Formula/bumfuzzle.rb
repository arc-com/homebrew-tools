class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.2.4.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "67197e1657201ad69e02fda3bf94c6749076b88d1b8bd12ca95167166ebd2663"
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
