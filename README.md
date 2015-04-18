# ipython-notebook

This repository provides a vagrant + saltstack configuration for bootstrapping a local ipython notebook server. The server runs in an Ubuntu 14.04 VM and is accessible on the host machine at `localhost:8888`.

## Why?

You could install Python, ipython notebook, and all other dependencies on your local machine, but it's still a bit of a pain.

This is a bit easier, because regardless of your OS, this is an easy way to get ipython notebook up and running without having to install a ton of dependencies on your local machine (just two: VirtualBox and Vagrant).


## Installation

1: Clone this repo to some directory on your computer.

2: [**Get VirtualBox for your OS**](https://www.virtualbox.org/wiki/Downloads)

3: [**Get Vagrant for your OS**](http://www.vagrantup.com/downloads.html)

4: From the command line, `cd` into the repository directory and run: `vagrant up`

That's it! Wait until Vagrant is done doing its thing. It will install all dependencies, configure ipython notebook, and start a server on the virtualbox that you can access.


## Access the server

Vagrant will run the configuration, then you should be able access the new ipython notebook server at `localhost:8888` or even `192.168.50.200:8888` (the static IP of this Vagrant box).

Note: If you're having problems use: `vagrant up | tee vagrant-results.txt` to write the the output to a file `vagrant-results.txt`. This will help you troubleshoot any issues that arise (or send them to me to troubleshoot).

Note: On Windows, I prefer using Git Bash, but this should work with the built-in command line, Powershell, etc.


## Configuration

If you need to change the IP or port of the IPython notebook server, first change the port value in `vm/config/ipython_notebook_config.py` and then you can modify the `HOST_PORT`, `GUEST_PORT`, and `VM_PRIVATE_IP` values in the `Vagrantfile`.

After making these changes, you can run `vagrant reload --provision` to apply these changes. If that doesn't work, you may need to `vagrant destroy` and `vagrant up` again to reliably rebuild the server.


## References:

**[Set up remote ipython notebook server on an ubuntu server](http://thomassileo.com/blog/2012/11/19/setup-a-remote-ipython-notebook-server-with-numpyscipymaltplotlibpandas-in-a-virtualenv-on-ubuntu-server/)** - This was useful for figuring out how to run a ipython notebook headless.
