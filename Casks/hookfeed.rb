cask "hookfeed" do
  version "0.2.0"
  sha256 "38d0f17f6b3bf6bd7a0c1325d70935aac0e5662bae5111d738b3119ef2032a7a"

  url "https://github.com/imknight/hookfeed/releases/download/v#{version}/HookFeed-#{version}.zip"
  name "HookFeed"
  desc "Native inbox for updates from local agents and scripts"
  homepage "https://github.com/imknight/hookfeed"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "HookFeed.app"
  binary "#{appdir}/HookFeed.app/Contents/Helpers/hookfeed"

  zap trash: [
    "~/Library/Application Support/HookFeed",
    "~/Library/Caches/app.hookfeed.HookFeed",
    "~/Library/HTTPStorages/app.hookfeed.HookFeed",
    "~/Library/Preferences/app.hookfeed.HookFeed.plist",
    "~/Library/Preferences/app.hookfeed.remote.settings.plist",
  ]
end
