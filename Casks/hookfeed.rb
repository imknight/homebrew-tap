cask "hookfeed" do
  version "0.1.0"
  sha256 "cd38255369ce5421174c9de3618bb2c7504c44f624407bcb2f3a3f001b42f7d5"

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
