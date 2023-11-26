#!/bin/bash
# Convenience to enable the virtualenv automatically
echo "source /home/vagrant/heltour/env/bin/activate" >> /home/vagrant/.bashrc

# Adapted from start.sh
virtualenv env --prompt="(heltour):" --python=/usr/local/bin/python3
source env/bin/activate

git config --global --add safe.directory /home/vagrant/heltour
cd /home/vagrant/heltour
poetry install

# Modify greeting message
echo "cat /home/vagrant/heltour/.devcontainer/welcome_bash.txt" >> /home/vagrant/.bashrc