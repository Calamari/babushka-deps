dep 'atom' do
  requires \
    'Atom.app',
    'atom packages'
end

dep 'Atom.app' do
  source "https://atom.io/download/mac"
  version '0'
end

meta :apm do
  accepts_value_for :version

  template {
    requires 'Atom.app'
    pkg_name = name.split('.').first

    met? {
      !shell("apm list | grep #{pkg_name}@").nil?
    }
    meet {
      shell("apm install #{pkg_name}")
    }
  }
end

apm_packages = [
  # beautification
  'atom-beautify',
  'editorconfig',
  # typescript support
  'atom-typescript',
  # autocompletion stuff
  'autocomplete-css',
  'autocomplete-paths',
  'autocomplete-plus',
  # git
  'git-blame',
  'merge-conflicts',
  # ctrl+click to get somewhere
  'hyperclick',
  'js-hyperclick',
  # vue support
  'language-vue',
  # linters
  'linter',
  'linter-eslint',
  'linter-flow',
  'linter-js-standard',
  'linter-rubocop',
  'linter-scss-lint',
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
