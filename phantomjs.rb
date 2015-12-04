dep 'phantomjs download', :download_path, :package_name do
  package_ext = '.zip'
  source = "https://bitbucket.org/ariya/phantomjs/downloads/#{package_name}#{package_ext}"

  met? { "#{download_path}/#{package_name}".p.exists? }
  meet {
    #shell "cd #{download_path}"
    log_shell "Download Phantomjs", "cd #{download_path} && wget #{source}"
    log_shell "Extract Phantomjs", "cd #{download_path} && unzip #{package_name}"
    shell "rm -rf #{download_path}/#{package_name}#{package_ext}"
  }
end

dep 'phantomjs', :version do
  version.default!('1.9.8')
  package_name = "phantomjs-#{version}-macosx"
  download_path = "#{ENV['HOME']}/.babushka/downloads"

  requires 'phantomjs download'.with(download_path, package_name)

  installed_bin = "/usr/local/lib/#{package_name}/bin/phantomjs"

  met? { installed_bin.p.exists? && shell("#{installed_bin} -v") == version }
  meet {
    log_shell "Unlink previous version", "rm /usr/local/bin/phantomjs", sudo: true if "/usr/local/bin/phantomjs".p.exists?
    log_shell "Remove lib of old version", "rm -rf /usr/local/lib/#{package_name}", sudo: true if "/usr/local/lib/#{package_name}".p.exists?
    log_shell "Copy Phantomjs", "mv #{download_path}/#{package_name} /usr/local/lib/#{package_name}"
    log_shell "Symlinking phantomjs", "ln -s #{installed_bin} /usr/local/bin/phantomjs", sudo: true
  }
end
