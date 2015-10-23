dep 'tap', :what do
  requires 'homebrew'
  # can't hurt to always do this, the tap command will not do anything if done already
  done = false
  met? { done }

  meet {
    shell "brew tap homebrew/#{what}"
    done = true
  }
end
