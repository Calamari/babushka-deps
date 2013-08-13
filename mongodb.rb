dep 'mongodb' do
  requires 'mongodb.managed'
end

dep 'mongodb.managed' do
  provides 'mongod'
end
