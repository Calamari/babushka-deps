dep "auto hide dock" do
  met? {
    shell("defaults read com.apple.dock autohide") == "1"
  }

  meet {
    shell("defaults write com.apple.dock autohide -bool true")
    shell("killall -HUP Dock")
  }
end

dep "dock position" do
  met? {
    shell("defaults read com.apple.dock orientation") == "right"
  }

  meet {
    shell("defaults write com.apple.dock orientation -string 'right'")
    shell("killall -HUP Dock")
  }
end

dep "osx settings" do
  requires \
    'auto hide dock',
    'dock position'
end
