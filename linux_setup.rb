dep 'curl.managed', sudo: true

dep 'linux cli' do
  requires [
    'curl.managed'
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
