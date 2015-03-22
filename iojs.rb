dep 'io.js', :version, :template => 'src' do
  version.default!('1.6.1')
  source "https://iojs.org/dist/v#{version}/iojs-v#{version}.tar.gz"
  provides "iojs ~> #{version}"
end
