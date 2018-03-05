dep 'Sublime Text.app' do
  source 'https://download.sublimetext.com/Sublime%20Text%20Build%203143.dmg'
end

dep 'subl', template: 'sym_link' do
  requires 'Sublime Text.app'

  source '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  destination '/usr/local/bin/subl'
  use_sudo true
end
