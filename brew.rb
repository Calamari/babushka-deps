dep 'brew' do
  met? { in_path? 'brew'}
  meet { shell 'ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"' }
end

dep 'tap dupes' do
  requires 'brew'
  # can't hurt to always do this, the tap command will not do anything if done already
  done = false
  met? { done }

  meet {
    shell "brew tap homebrew/dupes"
    done = true
  }
end
