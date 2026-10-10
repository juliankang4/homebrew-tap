# frozen_string_literal: true

cask "owngit" do
  version "1.1.8"
  sha256 "f618088161043bce020e097b0428bd3b97a54a55d9beb7b5014cb5a774de33ba"

  url "https://github.com/juliankang4/owngit/releases/download/v1.1.8/owngit_1.1.8_darwin_arm64.tar.gz"
  name "OwnGit"
  desc "Private Git storage and browser dashboard on your own computer"
  homepage "https://github.com/juliankang4/owngit"

  depends_on arch: :arm64
  depends_on formula: "juliankang4/tap/owngit"
  depends_on macos: :ventura

  app "OwnGit.app"

  uninstall quit:   "app.owngit.OwnGit",
            script: {
              executable: "#{appdir}/OwnGit.app/Contents/MacOS/OwnGitLauncher",
              args:       ["--sign-in-off"],
              sudo:       false,
            }

  caveats <<~EOS
    Run owngit service install to use the app in /Applications.
    The formula supplies the command and brew services. The cask supplies
    the menu bar app. OwnGit uses the /Applications app when its version
    matches the command. Without a matching cask, the command and server
    still work, but OwnGit does not open the formula's Cellar app.
    To update both, run: brew upgrade --formula owngit && brew upgrade --cask owngit
    Removing the cask leaves the formula, state and repositories in place.
  EOS
end
