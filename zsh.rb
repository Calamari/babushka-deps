dep 'zsh.managed'

dep 'zsh' do
  requires 'zsh.managed'
end

dep 'zsh as default' do
  requires 'zsh'

  met? { ENV['SHELL'].eql? '/usr/bin/zsh' }

  meet {
    sudo 'chsh -s $(which zsh)'
  }
end

dep 'oh-my-zsh' do
  requires 'zsh as default'

  def source
    'https://github.com/robbyrussell/oh-my-zsh.git'
  end
  def path
    File.expand_path '~/.oh-my-zsh'
  end
  met? { path.p.exists? }
  meet { git source, :to => path }
end
