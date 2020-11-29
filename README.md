# Multi-machine Vagrant

- We have created two VM's -- one for a database and another for the node app.

- We now want to be able to create both and run both with just a single use of `vagrant up`.

- Further, we want to be able to connect the app with the database to allow us to see the `posts` page

<br>

# Pre-requisites
- Install `Oracle Virtual Box` [here](https://www.virtualbox.org/wiki/Downloads). This is the software that allows us to create virtual machines (VM).

- Install `Vagrant` [here](https://www.vagrantup.com/downloads.html). We use Vagrant to manage our virtual machines in Oracle VM.

- Once `Vagrant` is installed, you need the `vagrant-hostsupdater` plugin. 
> Run `vagrant plugin install vagrant-hostsupdater` to install it

> Run `vagrant plugin uninstall vagrant-hostsupdater` to uninstall it

> There may be be some problems with this plugin, if you do encounter some just uninstall and then re-install

- One will also need `Ruby` installed, find it [here](https://www.ruby-lang.org/en/downloads/). 

<br>

# Instructions

- To see the tests that we need to pass, go into a terminal and navigate to the directory where you have this repo. Then `cd tests` and run `rake spec`

<br>

- To automate the installation of MongoDB into our VM we can make use of a bash script. This can be found in `environment/db/provision.sh` and in `environment/app/provision_db.sh`.
> Bash scripts have the extension `.sh`

<br>

- Since we want the database to listen to `0.0.0.0:27017` we must change the configuration file found in `/etc/mongod.conf`. We can do this through our provision file
> The command we add is `sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf`

<br>

- We now need to configure the app's provision file to allow it to connect to the database, which is now listening in all ports (`0.0.0.0`). To do so we must add commands to create a new environment variable called `DB_HOST`. We add the following lines inside `environment/app/provision.sh`:
```bash
# creates an environment variable
export DB_HOST=192.168.10.200

# these two lines will input the environment variable into the bashrc file
# the bashrc file runs everytime we start a terminal which in this case means we ssh into the VM
echo "export DB_HOST=192.168.10.200" >> ~/.bashrc
source ~/.bashrc
```

<br>

- Finally, both VM's are now configured as necessary and all we need to do now is `vagrant up`

<br>

- To see the app, navigate to the url `development.local:3000`. We can also view the posts page in `development.local:3000/posts`

<br>

---
**Used:**
- [Multi machine](https://www.vagrantup.com/docs/multi-machine)