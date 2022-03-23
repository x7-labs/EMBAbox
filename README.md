# Vagrantfile  - EMBAbox
This repo provides a Vagrantfile to simply test and to evaluate [EMBA](https://github.com/e-m-b-a/emba)

(based on https://github.com/botlabsDev/FACTbox )

## System requirements
Please keep in mind that FACT requires a lot of system resources. Therefore, the Vagrant VM will be build
with the following specs:

  * vb.cpus = 4
  * vb.memory = "10000"
  * config.disksize.size = "100GB"

## Installation steps

  ```
  $ sudo apt-get install vagrant virtualbox
  $ vagrant plugin install vagrant-reload vagrant-disksize  # reboot vm and resize disk
  $ git clone https://github.com/x7-labs/EMBAbox.git
  $ cd EMBAbox
  $ vagrant up
  ```

## Running

Vagrant will mount the current directory onto /vagrant hence the following flow can be applied

```
 $ vagrant ssh
 $ cd emba
 $ ./emba.sh -l /vagrant/log -f /vagrant/firmware.bin
```
