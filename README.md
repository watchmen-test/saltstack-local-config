# Local Setup for SaltStack Dev Environment

This will provision a local box so that you can use minikube the easy way with minikube.


## Getting Started

Clone the repo from this github repository to startup the project, the first thing you will want to do is read the README.

```
✓ Thats a check if you are reading this.
```

This project uses saltstack for windows and can be used to provision your local machine to be able to do development. You will need to install saltstack, but that can be achieved by running the `install.cmd` file. This will configure the following components

* Saltstack
* Hyper-V (Requires Restart)
* Hyper-V Nat Components
* Python
* Pip
* Pipenv
* PyInvoke
* Scoop
* DHCP Server for Hyper-V Nat

The aim of this project to ease the frustration that developers in the watchmen team have with setting up a local environment.

### Prerequisites

You will need at least windows powershell version 5.0 (can not automate install).

* [WMF 5.1](http://aka.ms/wmf5download)


### Installing

To get the build up and running on your machine do the following. You will need pipenv installed for this to work. Please see prerequisites.

Run a 

```
pipenv install
```

To run a build using the tooling use the `inv build` you will need to make sure that you provide the correct approariate secrets for the build to run. 


## Running the tests

This project has not tests at the moment. This will have tests in a future release.


### And coding style tests

For saltstack definition files please make sure to follow the following conventions.

1. Make sure that YAML files are linted, no tooling exists in the automated package but you can use yaml lint websites to ensure
2. Code blocks should be prefixed by a YAML comment this makes the YAML code easy and concise to follow and styled appropriately
3. Quote any variables that are used in blocks for example '{{ test_var }}'
4. Ensure to follow good PEP-8 standards.
5. If your code for a state file starts to get ugly consider moving this code into a module
6. Use stateful scripts if possible for scripting operations
7. Make sure to refrence files inside the installation of saltscripts with 'salt://'
8. If you don't need to install the file to the local system to run the script, don't.
9. Make sure that you follow appropriate pull request methodology for this repo
10. These rules can change in future pull requests



## Deployment

This is only deployed locally so additional deployment notes are unnecessary.

## FAQ

Q. I noticed that when I run provision nothing happens or I get an Error.
- Ensure that you have set the environemnt variable required like `EXECUTION_PATH`
- Ensure that you have the correct setup for your NAT setup `get-vmswitch` should only return one NATSwitch
- If possible try to run the tooling like `inv reprovision` it will rerun if possible your state files

Q. I noticed that minikube does not startup?
- Make sure that you have the correct version of minikube you can check this by running `where minikube` it will give you refrences to the application and what verision are paths. If possible uninstall chocolatey


## Built With

* [Scoop](https://get.scoop.sh) - Lightweight Package Manager for Windows
* [PyInvoke](http://www.pyinvoke.org/) - Python Tasks
* [SaltStack](https://saltstack.com) - Config Made Simple



## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Used purplebooths readme template
* Inspiration
* etc
