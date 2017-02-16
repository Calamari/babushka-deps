dep 'work ready' do
  requires \
    'build tools',
    'git.src',
    'git autocompletion',
    'nodejs',
    'npm.src',
    'phantomjs',
    'homebrew',
    'rvm ruby',
    'bundler',
    'atom',
    'iterm',
    'ccmenu.app',
    'configs',
    'pngenie',
    # Actual version of rsync:
    'rsync',
    # TODO: make choice for imageoptim
    'imagemagick',

    # Some useful command line tools
    'unrar.managed',
    'pwgen.managed',
    'ack.managed',

    # Databases
    'redis',
    'mongodb',
    'mysql',
    'postgres',

    # NPM packages
    'nodemon.npm',

    # networking tool
    'ngrep.managed'
end
