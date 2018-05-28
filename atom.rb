dep 'Atom with packages' do
  requires \
    'Atom',
    'atom packages'
end

dep 'Atom' do
  requires {
    on :ubuntu, 'atom.deb'
    on :elementary, 'atom.deb'
    on :osx, 'Atom.app'
  }
end

dep 'Atom.app' do
  source 'https://atom.io/download/mac'
  version '0'
end

dep 'atom.deb' do
  source 'https://atom.io/download/deb'
  download_path = '~/.babushka/downloads/atom.deb'

  met? { 'atom'.p.exists? }

  meet {
    log_shell 'Doanloading atom', "wget #{source} -o #{download_path}"
    log_shell 'Installing atom', "dpkg -i #{download_path}"
  }
end

dep 'Atom.app' do
  source 'https://atom.io/download/mac'
  version '0'
end

meta :apm do
  accepts_value_for :version

  template {
    requires 'Atom'
    pkg_name = name.split('.').first

    met? {
      !shell("apm list | grep #{pkg_name}@").nil?
    }
    meet {
      log_shell("installing atom package #{pkg_name}", "apm install #{pkg_name}")
    }
  }
end

apm_packages = [
  # beautification
  'atom-beautify',
  'editorconfig',
  # Typescript support
  'atom-typescript',
  # Flowtype support
  'ide-flowtype',
  # autocompletion stuff
  'autocomplete-css',
  'autocomplete-paths',
  'autocomplete-plus',
  # git
  'git-blame',
  # 'merge-conflicts',
  # ctrl+click to get somewhere
  # 'hyperclick',
  'js-hyperclick',
  # vue support
  'language-vue',
  # linters
  'linter',
  'linter-docker',
  'linter-eslint',
  'linter-flow',
  'linter-js-standard',
  'linter-rubocop',
  'linter-stylelint',
  'linter-ui-default',
  'linter-tslint',
  # Markdown support
  'markdown-preview-plus',
  # Theming
  'monokai',
  # Rails support
  'rails-rspec',
  # React support
  'react',
  # Javascript snippets
  'standardjs-snippets',
  'atom-jest-snippets',
  # Remote collaboration
  'teletype',
  # Showing ToDo
  'todo-show'
]
apm_packages.each do |pkg|
  dep "#{pkg}.apm"
end

dep 'atom packages' do
  apm_packages.each do |pkg|
    requires "#{pkg}.apm"
  end
end
