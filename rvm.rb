dep 'rvm' do
  met? { "#{ENV['HOME']}/.rvm".p.exists? }

  meet {
    log_shell 'Downloading and installing RVM', 'curl -sSL https://get.rvm.io | bash -s stable'
  }
end

dep 'rubocop.gem' do
  installs 'rubocop'
end

dep 'rvm ruby', :version do
  requires \
    'rvm',
    'rubocop.gem'

  version.default!('2.4.0')

  # write version into ~/.rvm/version
  met? {
    "#{ENV['HOME']}/.rvm/rubies/ruby-#{version}".p.exists?
  }

  meet {
    log_shell "Installing ruby", "$HOME/.rvm/bin/rvm install #{version}", sudo: true
    log_shell "Making #{version} the default ruby", "$HOME/.rvm/bin/rvm --default use #{version}", sudo: true
  }
end
