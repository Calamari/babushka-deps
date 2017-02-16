dep 'work ready' do
  requires \
    'build tools',
    'git.src',
    'git autocompletion',
    'nodejs',
    'io.js',
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

    # Some useful line tools
    'unrar.managed',
    'pwgen.managed',

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
