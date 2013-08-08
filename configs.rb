dep 'configs' do
  files = ['.gitconfig']

  met? {
    all_there = files.index {|file| !"#{ENV['HOME']}/#{file}".p.exists? }.nil?
  }
  meet {
    files.each do |file|
      target_file = "#{ENV['HOME']}/#{file}"
      unless target_file.p.exists?
        log_shell "copy config #{file}", "cp #{ENV['HOME']}/.babushka/deps/configs/#{file} #{target_file}"
      end
    end
  }
end
