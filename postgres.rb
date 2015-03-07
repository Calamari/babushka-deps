# call this dep, not those below
dep 'postgres' do
  requires 'postgres commandline'

  met? { '/Applications/Postgres.app'.p.exists? }
  meet {
    log_shell "Install Postgres", "mv ~/Applications/Postgres.app /Applications/Postgres.app"
  }
end

dep 'postgres.app' do
  version_number = '9.4.1.0'
  source "https://github.com/PostgresApp/PostgresApp/releases/download/#{version_number}/Postgres-#{version_number}.zip"

  provides 'Postgres.app'
  version version_number
end

dep 'postgres commandline' do
  main_version = '9.4'
  requires 'postgres.app'

  init_string = "export PATH=/Applications/Postgres.app/Contents/Versions/#{main_version}/bin/:$PATH"

  met? {
    shell("cat ~/.bash_profile").include?(init_string)
  }
  meet {
    shell "echo '# Add postgres commandline tools to bash' >> ~/.bash_profile"
    log_shell "Add init to .bash_profile", "echo '#{init_string}' >> ~/.bash_profile"
  }
end
