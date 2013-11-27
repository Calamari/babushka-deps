dep 'phantomjs download', :download_path do
  package_name = 'phantomjs-1.9.1-macosx'
  package_ext = '.zip'
  source = "https://phantomjs.googlecode.com/files/#{package_name}#{package_ext}"

  met? { "#{download_path}/#{package_name}".p.exists? }
  meet {
    #shell "cd #{download_path}"
    log_shell "Download Phantomjs", "cd #{download_path} && wget #{source}"
    log_shell "Extract Phantomjs", "cd #{download_path} && unzip #{package_name}"
    shell "rm -rf #{download_path}/#{package_name}"
  }
end

dep 'phantomjs' do
  package_name = 'phantomjs-1.9.1-macosx'
  download_path = "#{ENV['HOME']}/.babushka/downloads"

  requires 'phantomjs download'.with(download_path)

  met? { in_path? 'phantomjs' }
  meet {
    log_shell "Copy Phantomjs", "mv #{download_path}/#{package_name} /usr/local/lib/#{package_name}"
    File.symlink "/usr/local/lib/#{package_name}/bin/phantomjs", "/usr/local/bin/phantomjs"
  }
end