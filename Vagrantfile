Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 1024
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # /vagrant に Rails アプリケーションを配置する
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
    rsync__options: ["--verbose", "--archive", "--compress", "--delete", "-C", "--filter=':- .gitignore'"]

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /vagrant

    sudo apt-get update
    sudo apt-get install -y --no-install-recommends \
      ruby bundler \
      build-essential ruby-dev libpq-dev libicu-dev \
      nodejs default-jre-headless unzip postgresql redis-server imagemagick git

    export RAILS_ENV=development

    echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc
    bundle install

    sudo -u postgres createuser -d vagrant
    bundle exec rake db:create:all
    ENJU_SKIP_SOLR=true bundle exec rails g enju_leaf:quick_install

    cat > .env <<EOF
RAILS_ENV=${RAILS_ENV}
SECRET_KEY_BASE=`bundle exec rake secret`
SOLR_URL=http://localhost:8983/solr/default
EOF
    bundle exec whenever --update-crontab

    # vagrant ssh 直後に /vagrant に移動する
    echo 'cd /vagrant' >> ~/.bashrc
  SHELL
end
