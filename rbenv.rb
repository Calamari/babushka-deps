dep 'rbenv' do
  requires \
    'rbenv cloned',
    'rbenv path',
    'rbenv init',
    'ruby-build.managed', # allows installing ruby version through 'rbenv install #version'
    'rbenv version'
end

dep 'rbenv cloned' do
  met? {
    p "#{ENV['HOME']}/.rbenv"
    "#{ENV['HOME']}/.rbenv".p.exists?
  }

  meet {
    log_shell "Cloning rbenv", "git clone https://github.com/sstephenson/rbenv.git #{ENV['HOME']}/.rbenv"
  }
end

dep 'rbenv init' do
  init_string = "eval \"$(rbenv init -)\""

  met? {
    shell("cat #{ENV['HOME']}/.bash_profile").include?(init_string)
  }

  meet {
    log_shell "Add init to .bash_profile", "echo '#{init_string}' >> ~/.bash_profile"
    shell '$HOME/.rbenv/bin/rbenv init'
  }
end

dep 'rbenv path' do
  export_string = "export PATH=$HOME/.rbenv/bin:$PATH"

  met? {
    shell("cat #{ENV['HOME']}/.bash_profile").include?(export_string)
  }

  meet {
    log_shell "Add rbenv to PATH", "echo '#{export_string}' >> ~/.bash_profile"
    shell export_string
    p shell "echo $PATH"
  }
end


dep 'ruby-build.managed'

dep 'rbenv ruby', :version do
  requires \
    'rbenv'

  version.default!('2.0.0-p247')

  # write version into ~/.rbenv/version
  met? {
    "#{ENV['HOME']}/.rbenv/versions/#{version}".p.exists?
  }

  meet {
    log_shell "Installing ruby", "PATH=$HOME/.rbenv/bin:$PATH rbenv install #{version}"
  }
end
