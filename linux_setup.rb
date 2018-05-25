dep 'curl.managed', sudo: true
dep 'vim.managed', sudo: true

dep 'openssl.lib' do
  installs {
    via :apt, 'libssl-dev'
    via :yum, 'openssl-devel'
    otherwise 'openssl'
  }
end
dep 'linux cli' do
  requires [
    'build tools',
    'openssl.lib',

    'curl.managed',
    'vim.managed',
    'nodejs',

    'docker.bin'
  ]
end

dep 'linux apps' do
  requires [
    'Atom with packages'
  ]
end

dep 'linux setup' do
  requires [
    'linux cli',
    'linux apps'
  ]
end

dep 'XING ready' do
  requires [
    'XING docker dns'
  ]
end
