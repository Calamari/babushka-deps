dep "Adium.app" do
  source "http://downloads.sourceforge.net/project/adium/Adium_1.5.10.dmg"
end

dep "Alfred.app" do
  source "https://cachefly.alfredapp.com/Alfred_3.3_801.dmg"
end

dep 'CCMenu.app' do
  source 'http://downloads.sourceforge.net/project/ccmenu/CCMenu/1.8.1/ccmenu-1.8.1-b.dmg?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fccmenu%2Ffiles%2FCCMenu%2F&ts=1376302636&use_mirror=netcologne'
end

dep "Dropbox.app" do
  source "https://www.dropbox.com/download?plat=mac"
end

dep "Evernote.app" do
  source "https://cdn1.evernote.com/mac-smd/public/Evernote_RELEASE_6.10_454267.dmg"
end

dep "KeepassX.app" do
  source "https://www.keepassx.org/releases/2.0.3/KeePassX-2.0.3.dmg"
end

dep "Postgres.app" do
  source "https://github.com/PostgresApp/PostgresApp/releases/download/v2.0.2/Postgres-2.0.2.dmg"
end

# TODO: Create a template from this
dep 'Slack download', :download_path, :file_name do
  package_name = 'Slack-2.4.1-macOS.zip'
  source = "https://downloads.slack-edge.com/mac_releases/#{package_name}"

  met? { "#{download_path}/#{file_name}".p.exists? }
  meet {
    log_shell "Download #{file_name}", "cd #{download_path} && wget #{source}"
    log_shell "Extract #{file_name}", "cd #{download_path} && unzip #{package_name}"
    shell "rm #{download_path}/#{package_name}"
  }
end
dep 'Slack' do
  download_path = "#{ENV['HOME']}/.babushka/downloads"
  file_name = 'Slack.app'

  requires_when_unmet 'Slack download'.with(download_path, file_name)

  met? { "/Applications/#{file_name}".p.exists?.tap { |v| p v } }
  meet {
    log_shell "Install #{file_name}", "mv #{download_path}/#{file_name} /Applications/#{file_name}"
  }
end

dep "VirtualBox.app" do
  source "http://download.virtualbox.org/virtualbox/4.3.18/VirtualBox-4.3.18-96516-OSX.dmg"
end

dep "VLC.app" do
  source "http://get.videolan.org/vlc/2.1.5/macosx/vlc-2.1.5.dmg"
end

dep "macOS Apps" do
  requires \
    'Adium.app',
    'Alfred.app',
    'CCMenu.app',
    'Dropbox.app',
    'Evernote.app',
    'KeepassX.app',
    'Postgres.app',
    'Slack',
    'VirtualBox.app',
    'VLC.app'
end
