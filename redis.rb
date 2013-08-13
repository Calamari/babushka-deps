dep 'redis' do
  requires 'redis.managed'
end

dep 'redis.managed' do
  provides 'redis-server'
end
