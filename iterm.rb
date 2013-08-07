dep 'iterm download' do
  package_name = 'iTerm2_v1_0_0.zip'
  source = "http://www.iterm2.com/downloads/stable/#{package_name}"

  download_path = "#{ENV['HOME']}/.babushka/downloads"

  met? { "#{download_path}/iTerm.app".p.exists? }
  meet {
    #shell "cd #{download_path}"
    log_shell "Download iTerm", "cd #{download_path} && wget #{source}"
    log_shell "Extract iTerm", "cd #{download_path} && unzip #{package_name}"
    shell "rm #{download_path}/#{package_name}"
  }
end
dep 'iterm' do
  requires 'iterm download'

  download_path = "#{ENV['HOME']}/.babushka/downloads"

  met? { '/Applications/iTerm.app'.p.exists?.tap{|v| p v} }
  meet {
    log_shell "Install iTerm", "mv #{download_path}/iTerm.app /Applications/iTerm.app"
  }
end