#!/bin/sh

# A Ubuntu 14.04 install aimed for Ruby on Rails development

# This box start with a basic Ubuntu 14.04 (trusty) based on phusion/ubuntu-14.04-amd64
# And it adds the following packages aimed for rails development

# - rbenv and ruby-build
# - ruby 2.3.1 with bundler
# - Git 1.9.1
# - Postgresql 9.3
# - NodeJS
# - Heroku Toolbelt
# - PhantomJS 1.9.7
# - Qt for Capybara Webkit
# - ImageMagick

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

# essentials
# sudo apt-get update
# sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libcurl4-openssl-dev curl wget

# SQLite, Git
sudo apt-get install -y libsqlite3-dev git

# Qt for Capybara Webkit
sudo apt-get install -y libqtwebkit-dev

# Postgres
sudo apt-get install -y postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3

# NodeJS
#sudo apt-get install -y nodejs

# Heroku
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# setup rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install ruby 2.3.1 and bundler
rvm install ruby-2.3.1
rvm use 2.3.1
# export RBENV_ROOT="${HOME}/.rbenv"
# export PATH="${RBENV_ROOT}/bin:${PATH}"
# export PATH="${RBENV_ROOT}/shims:${PATH}"
# rbenv install 2.3.1
# rbenv global 2.3.1
gem install bundler
gem install rails
# rbenv rehash

# Phantomjs
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 -P /usr/local/share --quiet
sudo tar xjf /usr/local/share/phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /usr/local/share
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

# cleanup
sudo apt-get clean