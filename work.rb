dep 'work ready' do
  requires \
    'brew',
    'build tools',
    'git.src',
    'git autocompletion',
    'nodejs',
    'npm.src',
    'phantomjs',
    'homebrew',
    'subl',
    'sublime package control',
    'rvm ruby',
    'bundler',
    'sublime bundler',
    'iterm',
    'ccmenu.app',
    'configs',
    'pngenie',
    # TODO: make choice for imageoptim
    'imagemagick',

    # Some useful line tools
    'unrar.managed',
    'pwgen.managed',

    # Databases
    'redis',
    'mongodb',
    'mysql',

    # NPM packages
    'nodemon.npm',

    # networking tool
    'ngrep.managed'
end
