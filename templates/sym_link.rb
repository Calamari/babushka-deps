meta :sym_link do
  accepts_value_for :source, nil
  accepts_value_for :destination, nil
  accepts_value_for :use_sudo, false

  template {
    met? { destination.p.exists? }

    meet {
      log_shell "Symlinking #{destination}",
                "ln -s #{source} #{destination}",
                sudo: use_sudo
    }
  }
end
