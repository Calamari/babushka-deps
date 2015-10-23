dep 'apache bench' do
  requires \
    'tap'.with('apache'),
    'ab.managed'
end

dep 'ab.managed' do
  provides "ab"
end
