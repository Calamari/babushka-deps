dep 'pngenie download', :download_path, :file_name do
  package_name = 'pngenie.zip'
  source = "http://www.gingerbeardman.com/pngenie/#{package_name}"

  met? { "#{download_path}/#{file_name}".p.exists? }
  meet {
    #shell "cd #{download_path}"
    log_shell "Download #{file_name}", "cd #{download_path} && wget #{source}"
    log_shell "Extract #{file_name}", "cd #{download_path} && unzip #{package_name}"
    shell "rm #{download_path}/#{package_name}"
  }
end
dep 'pngenie' do
  download_path = "#{ENV['HOME']}/.babushka/downloads"
  file_name = 'PNGenie.app'

  requires 'pngenie download'.with(download_path, file_name)


  met? { "/Applications/#{file_name}".p.exists?.tap{|v| p v} }
  meet {
    log_shell "Install #{file_name}", "mv #{download_path}/#{file_name} /Applications/#{file_name}"
  }
end
