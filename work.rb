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
    'rbenv ruby',
    'bundler',
    'sublime bundler',
    'iterm',
    'ccmenu.app',
    'configs',
    'pngenie',
    # TODO: make choice for imageoptim
    'imagemagick',

    # Databases
    'redis',
    'mongodb',
    'mysql',

    # NPM packages
    'nodemon.npm',

    # networking tool
    'ngrep.managed'
end
