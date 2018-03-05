dep 'work ready' do
  requires \
    'build tools',
    'git.src',
    'git autocompletion',
    'node installs',
    'phantomjs',
    'homebrew',
    'languages',
    'bundler',
    # 'atom',
    'subl',
    'iterm',
    'configs',
    'pngenie',
    # Actual version of rsync:
    'rsync',
    # TODO: make choice for imageoptim
    'imagemagick',

    'macOS Apps',

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
