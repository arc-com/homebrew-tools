class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.2.8.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "d46f50ae78feac7780322e878b6f2f5ddd2cbd24d58b3ccb8c0c56c9735089d0"
  license "MIT"

  depends_on "yq"
  depends_on "python@3.12"

  def install
    libexec.install "bumfuzzle-template.yml", "index.html", "scripts", "VERSION"
    bin.install_symlink libexec/"scripts/bumfuzzle.sh" => "bumfuzzle"
    bin.install_symlink libexec/"scripts/bumfuzzle.sh" => "bf"
  end

  test do
    system bin/"bumfuzzle", "--help"
  end
end
