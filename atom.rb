dep 'atom.app' do
  source "https://atom.io/download/mac"
  provides 'Atom.app'
  version '0'
end

dep 'atom', :template => 'sym_link' do
  requires 'atom.app'

  # TODO: add packages to install
end
