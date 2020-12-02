# vagrant-spring-api

(c) Andre Lohmann (and others) 2020

## Maintainer Contact
 * Andre Lohmann
   <lohmann.andre (at) gmail (dot) com>

## content

This vagrant machine will build the development foundation for the [spring articles api](https://github.com/smartformer/springboot-articles_api).

## Prequesites

### VirtualBox

  * Install the latest virtualbox from oracle repositories (https://www.virtualbox.org/wiki/Downloads)
  * If you are on a linux distro, follow the instructions to add the oracle repo
  * Install the latest Oracle VM VirtualBox Extension Pack

### Vagrant

#### cli

  * Install the latest vagrant (https://www.vagrantup.com/downloads.html)

#### plugins

The vagrant machines depends on the following vagrant plugins.

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
```

These plugins should get installed automatically on a "vagrant up", if that fails anyways, please manually install the plugins by entering the commands.

## usage

### upstart

  * Clone the repo and change to the directory
  * copy ansible_vagrant/custom_vars.yml.example to ansible_vagrant/custom_vars.yml
  * Run the machine

```
vagrant up
vagrant ssh
```

### Application

Enter the application folder from within the VM

```
cd /home/vagrant/application
```

Run all tests

```
./mvnw clean verify
```

Startup the Application

```
./mvnw spring-boot:run
```

### Browse

If you havn't changed the test domains in config.yml, you can open following endpoint:

  * http://app.lokal

### REST

When you have started up the application within vagrant, you can use the following REST Calls

#### Health check

```
curl -i http://app.lokal/actuator/health
```

#### List empty articles

```
curl -i http://app.lokal/articles/
```

#### Create article

```
curl -i -H "Content-Type: application/json" -X POST -d '{"title":"Dynamic added Article","content":"This is the content of a dynamically added article"}' http://app.lokal/articles
```

#### List article

```
curl -i http://app.lokal/articles/1
```

#### Update article

```
curl -i -H "Content-Type: application/json" -X PUT -d '{"title":"Dynamic added Article","content":"This is the edited content of a dynamically added article"}' http://app.lokal/articles/1
curl -i http://app.lokal/articles/1
curl -i http://app.lokal/articles/
```

#### Delete article

```
curl -i -X DELETE http://app.lokal/articles/1
curl -i http://app.lokal/articles/
```
