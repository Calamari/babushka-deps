# dep 'erlang.app' do
#   source 'https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.2-1~osx~10.10_amd64.dmg'
#
#   provides 'erl'
# end

dep 'erlang.managed' do
  requires_when_unmet 'homebrew'
  provides 'erl'
end

dep 'elixir.managed' do
  requires_when_unmet 'homebrew'
  requires 'erlang.managed'

  provides 'elixir'
end

dep 'languages' do
  requires \
    'rvm ruby'
    #'elixir.managed' Erlang not done yet
end
