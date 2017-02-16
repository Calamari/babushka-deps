dep 'nodejs', :version, :template => 'src' do
  version.default!('6.9.5')
  source "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  provides "node ~> #{version}"
end

dep 'nodemon.npm' do
  requires 'npm.src'

  provides 'nodemon'
end

dep 'nvm.npm' do
  requires 'npm.src'

  provides 'nvm'
end

dep 'node installs' do
  requires \
    'nodejs',
    'nvm.npm'
end
