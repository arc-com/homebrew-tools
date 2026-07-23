class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.7.2.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "50a8b00ac0675fdd4c01bd8116381d848e8154f016de4511e52acf97240e081b"
  license "MIT"

  depends_on "yq"
  depends_on "python@3.12"

  def install
    libexec.install "bumfuzzle-template.yml", "index.html", "scripts", "skills", "VERSION"
    bin.install_symlink libexec/"scripts/bumfuzzle.sh" => "bumfuzzle"
    bin.install_symlink libexec/"scripts/bumfuzzle.sh" => "bf"
  end

  test do
    system bin/"bumfuzzle", "--help"
  end
end
