dep 'brew' do
  met? { in_path? 'brew'}
  meet { shell 'ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"' }
end
