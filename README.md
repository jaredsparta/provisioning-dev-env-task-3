# Multi-machine Vagrant

## Summary

The sample application has the ability to connect to a database. We need to provision our development environment with a vm for the database and one for the database.

Vagrant is capable of running two or more virtual machines at once with different configurations.

## Tasks

* Research how to create a multi machine vagrant environment
* Add a second virtual machine called "db" to your Vagrant file
* Configure the db machine with a different IP from the app
* Provision the db machine with a MongoDB database


## Notes
When you have the second machine running further configuration of the app is required to make it use the database. We will cover this in the next lesson.

You can test your database is working correctly by running the test suite in the test folder. There are two sets of tests. One for the app VM and one for the db VM. Make them all pass.
```
cd test
rake spec
```
## Acceptance Criteria
* Uses vagrant file
* Create 2 VM APP and Mongod
* Localhost set to development.local
* App works on Port 3000 (development.local:3000)
* Work with only command "vagrant up" &/or mininum commands
* All tests passing
* works on /posts
* works on /fibonacci/30
* Documentation exists as README.md file
* Documentation includes: Intro (purpose of repo), Pre Requisits  and Intructions
* Instructions have a clear step by step
* repo exists on github

<br>
<br>
<br>

# Pre-requisites
- Install `Oracle Virtual Box` [here](https://www.virtualbox.org/wiki/Downloads). This is the software that allows us to create virtual machines (VM).

- One will need `Vagrant` installed, find it [here](https://www.vagrantup.com/downloads.html). We use Vagrant to manage our virtual machines in Oracle VM.

- Once `Vagrant` is installed, you need the `vagrant-hostsupdater` plugin. Run `vagrant plugin install vagrant-hostsupdater` to install it. For knowledge, `vagrant plugin uninstall vagrant-hostsupdater` will uninstall this.
> There may be be some problems with this plugin, if you do encounter some just uninstall and then re-install

- One will also need `Ruby` installed, find it [here](https://www.ruby-lang.org/en/downloads/). 

<br>

# Instructions

- To see the tests that we need to pass, go into a terminal and navigate to the directory where you have this repo. Then `cd tests` and run `rake spec`

- To automate the installation of MongoDB into our VM we can make use of a bash script. This can be found in `environment/app/provision.sh` and in `environment/app/provision_db.sh`.
> Bash scripts have the extension `.sh`

- To automatically make MongoDB listen on `0.0.0.0:27017`, we create a `mongod-copy.conf` file in `config-files` and sync this folder with the VM. Within this copy, we change the `port` and `bindip` values. We then use bash commands in `provision.sh` to replace the `mongod.conf` file in `/etc` to this one. The second line allows one to replace the contents of the file without renaming it.
```bash
cd /folder1 
sudo cp -f mongod-copy.conf /etc/mongod.conf
```

- To run the VM, all one would need to then do is navigate to the root of this directory (the level that contains the Vagrantfile) and then `vagrant up`. This will automatically start both VM's.
> If it does not work, try to `vagrant up db` and then `vagrant up app` separately.

- To see the app, navigate to the url `development.local:3000`.

<br>

---
**Used:**
- [Multi machine](https://www.vagrantup.com/docs/multi-machine)