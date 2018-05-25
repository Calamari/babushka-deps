dep 'nvm', :version do
  version.default!('0.33.11')
  # met? { log in_path?('nvm --version') }
  met? { "~/.nvm".p.dir? }
  meet {
    log_shell 'Downloading & installing nvm', "wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash"
  }
end

dep 'nodejs', :version do
  version.default!('8')

  requires 'nvm'

  nvm_exec = '. ~/.nvm/nvm.sh && nvm'

  met? { shell?("#{nvm_exec} which #{version}") }
  meet {
    shell "#{nvm_exec} install #{version}"
  }
end
