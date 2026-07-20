class Bumfuzzle < Formula
  desc "Config-driven guardrails and scaffolding for AI coding agents"
  homepage "https://github.com/arc-com/bumfuzzle"
  url "https://github.com/arc-com/bumfuzzle/archive/refs/tags/v1.4.0.tar.gz"
  # populated by arc-com/bumfuzzle's scripts/release/release-homebrew.sh
  sha256 "d7f30884146780c095172c4d72861ee538b01034b11c05908eaf0a210d6db798"
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
