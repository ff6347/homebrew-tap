# ABOUTME: Builds igittigit from its release source with the local Go toolchain.
# ABOUTME: Installs and verifies the CLI without downloading prebuilt executables.
class Igittigit < Formula
  desc "CLI for fetching .gitignore templates from GitHub"
  homepage "https://github.com/ff6347/igittigit"
  url "https://github.com/ff6347/igittigit/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "6933b85bd38bcd701ee73c2f3d55f6529ae98a92dd8efa51531c86963adf2c37"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "igittigit [--here] [--allow]", shell_output("#{bin}/igittigit --help")
  end
end
