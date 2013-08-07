dep 'sublime.app' do
  source 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg'
  provides 'Sublime Text 2.app'
  version '0'
end

dep 'subl', :template => 'sym_link' do
  requires 'sublime.app'

  source '/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
  destination '/usr/local/bin/subl'
  use_sudo true
end

dep 'sublime package control' do
  requires 'wget.managed'
  package_name = "Package\ Control.sublime-package"
  dir = "#{ENV['HOME']}/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages/"
  source = "http://sublime.wbond.net/Package%20Control.sublime-package"

  met? {
    "#{dir}#{package_name}".p.exists?
  }
  meet {
    shell "wget --directory-prefix='#{dir}' #{source}"
  }
end
