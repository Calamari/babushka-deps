dep 'git autocompletion' do
  requires 'git'

  met? { "~/.git-completion.bash".p.exists? }

  meet {
    log_shell "Downloading git-completion.bash", "curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o $HOME/.git-completion.bash"
    log_shell "Putting it into .bash_profile", "echo '# Git Autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi' >> $HOME/.bash_profile"
  }
end

dep 'git', :version, :template => 'src' do
  version.default!('2.6.1')
  source "https://www.kernel.org/pub/software/scm/git/git-#{version}.tar.gz"
  provides "git ~> #{version}"
end
