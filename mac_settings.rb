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

# The default for this is to show all the files, which is slow and eating up so much memory
dep "finder open home default" do
  met? {
    shell("defaults read com.apple.finder NewWindowTarget") == "PfHm"
  }

  meet {
    shell("defaults write com.apple.finder NewWindowTarget PfHm")
    shell("killall -HUP Finder")
  }
end

dep "osx settings" do
  requires \
    'auto hide dock',
    'dock position',
    'finder open home default'
end
