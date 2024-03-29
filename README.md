# jumpstart-macos

[![Ansible lint](https://github.com/patryk-gpl/jumpstart-macos/actions/workflows/lint.yml/badge.svg)](https://github.com/patryk-gpl/jumpstart-macos/actions/workflows/lint.yml)
[![SonarCloud analysis](https://github.com/patryk-gpl/jumpstart-macos/actions/workflows/sonar.yml/badge.svg)](https://github.com/patryk-gpl/jumpstart-macos/actions/workflows/sonar.yml)

- [Important](#important)
- [Tools](#tools)
  - [Initial setup](#initial-setup)
  - [App Store](#app-store)
  - [Custom software from web](#custom-software-from-web)
  - [Ansible](#ansible)
    - [Cheat sheet](#cheat-sheet)
  - [Minikube](#minikube)
- [Known issues](#known-issues)
- [Resources, links](#resources-links)
  - [Ansible](#ansible-1)
  - [Dev Tools](#dev-tools)
  - [Kubernetes and K8S tools](#kubernetes-and-k8s-tools)
  - [Sonar](#sonar)
  - [Terraform and tools](#terraform-and-tools)
  - [Github](#github)
  - [Visual Studio Code extensions and settings](#visual-studio-code-extensions-and-settings)

This repository contain an automated procedure to jump-start installation and configuration of Mac OS.
The procedure assume Ansible is going to be used to keep configuration in sync.

## Important

This procedure was tested on Mac OS Apple Silicon M2:

    # sysctl machdep.cpu.brand_string

    machdep.cpu.brand_string: Apple M2 Pro

## Tools

### Initial setup

1.  Make sure you have installed `homebrew` on your Mac. Detailed instructions to be found [here](https://brew.sh) 2. Install required tools via `brew install ansible direnv`
2.  Install ZSH framework (in case zsh shell is used): `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
3.  Make sure your Git `user` and `email` are set.

        git config --global user.name FirstName LastName
        git config --global user.email email

    On new computer you can also set this one up:

        git config --global push.autoSetupRemote true
        git config --global branch.autoSetupRebase always

### App Store

To install:

- Microsoft Teams

### Custom software from web

- [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)
- [NTFS on Mac](https://github.com/osxfuse/osxfuse/wiki/NTFS-3G)
- [Enabling NTFS write in macOS the Open source way](https://medium.com/macoclock/enabling-ntfs-write-in-macos-10-15-catalina-the-open-source-way-a5fd0d1cb32e)

### Ansible

#### Cheat sheet

- Get a list of Ansible installed collections

        ansible-galaxy collection list

### Minikube

To set a default driver with `docker`:

    minikube config set driver docker

To add a local Docker registry:

    minikube addons enable registry

Restart Docker:

    sudo killall Docker && open /Applications/Docker.app

- Minikube [documentation](https://minikube.sigs.k8s.io/docs/)

## Known issues

- Ansible requirements.txt needed with list of collections in order to work properly with Ansible linter running on Github Actions runner, [see ansible-lint-action Issue-99](https://github.com/ansible/ansible-lint-action/issues/99)

## Resources, links

### Ansible

- Interpreter [discovery](https://docs.ansible.com/ansible/latest/reference_appendices/interpreter_discovery.html)
- Ansible Configuration [Settings](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings)
- Re-using Ansible [artifacts](https://docs.ansible.com/ansible/6/user_guide/playbooks_reuse.html#playbooks-reuse)

### Dev Tools

- 5 Ways to Manage Environment Variables with [direnv](https://www.sixfeetup.com/blog/direnv-manage-environment-variables)
- Custom [status badges](https://css-tricks.com/adding-custom-github-badges-to-your-repo/)

### Kubernetes and K8S tools

- Getting started with [Flux v2](https://fluxcd.io/flux/get-started/)

### Sonar

- SonarCloud [docs](https://docs.sonarcloud.io/)

### Terraform and tools

- [tfswitch](https://tfswitch.warrensbox.com/Install/) command line tool lets you switch between different versions of terraform

### Github

- Git config [settings](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushautoSetupRemote)
- Github [actions](https://docs.github.com/en/actions)
- Github [Rest API](https://docs.github.com/en/rest/actions/workflows)
- Github [blog](https://github.blog/)

### Visual Studio Code extensions and settings

- [Configuring Markdownlint Alongside Prettier](https://blog.joshuakgoldberg.com/configuring-markdownlint-alongside-prettier/)
