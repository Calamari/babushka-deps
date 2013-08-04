dep 'sublime.app' do
  source 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg'
end

dep 'subl', template: 'sym_link' do
  requires 'sublime.app'

  source '/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
  destination '/usr/local/bin/subl'
  use_sudo true
end
