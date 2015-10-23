dep 'rsync' do
  requires \
    'tap'.with('dupes'),
    'rsync.managed'
end

dep 'rsync.managed', :version do
  version.default!('3.1.1')
  provides "rsync ~> #{version}"
end
