dep "docker.bin", :version do
  version.default!("17.12.1-ce")

  requires [
    "docker-compose"
  ]

  requires_when_unmet do
    on :apt, "keyed apt source".with(
      uri: "https://download.docker.com/linux/ubuntu",
      release: "xenial",
      repo: "stable",
      key_sig: "0EBFCD88",
      key_uri: "https://download.docker.com/linux/ubuntu/gpg"
    )
  end

  installs do
    via :apt, "docker-ce"
    via :brew, "docker"
  end

  provides "docker >= #{version}"
end

dep "XING docker dns" do
  requires [
    "docker.bin"
  ]

  def daemon_config
    "/etc/docker/daemon.json"
  end

  met? { daemon_config.p.exists? }

  meet do
    shell "mkdir -p /etc/docker/"
    shell %(echo '{"dns": ["10.0.0.53"]}' > #{daemon_config})
    shell "chmod 644 #{daemon_config}"
  end
end

dep "docker-compose", :version do
  version.default!("1.21.2")

  met? do
    in_path? "docker-compose >= #{version}"
  end

  meet do
    sudo "curl -L https://github.com/docker/compose/releases/download/#{version}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
    sudo "chmod a+x /usr/local/bin/docker-compose"
  end
end
