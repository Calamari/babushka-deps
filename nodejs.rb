dep 'nodejs', :version, template: 'src' do
  version.default!('0.10.15')
  source "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz"
  provides "node ~> #{version}"
end
