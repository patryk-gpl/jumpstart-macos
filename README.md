- [Introduction](#introduction)
  - [Important](#important)
- [Tools](#tools)
  - [Initial setup](#initial-setup)
  - [Ansible](#ansible)
    - [Cheat sheet](#cheat-sheet)
    - [Links](#links)
  - [Minikube](#minikube)
- [Some useful links](#some-useful-links)

# Introduction

This repository contain an automated procedure to jump-start installation and configuration of Mac OS.
The procedure assume Ansible is going to be used to keep configuration in sync.

## Important

This procedure was tested on Mac OS Apply M2:

    # sysctl machdep.cpu.brand_string

    machdep.cpu.brand_string: Apple M2 Pro

# Tools

## Initial setup

1. Make sure you have installed `homebrew` on your Mac. Detailed instructions to be found [here](https://brew.sh)
2. Install required tools via `brew install ansible direnv`
3. Make sure your Git `user` and `email` are set.

        git config --global user.name FirstName LastName
        git config --global user.email email

On new computer you can also set this one up:

    git config --global push.autoSetupRemote true

Show explanation from Git [documentation](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushautoSetupRemote):

     push.autoSetupRemote

If set to *"true"* assume `--set-upstream` on default push when no upstream tracking exists for the current branch; this option takes effect with `push.default` options simple, upstream, and current. It is useful if by default you want new branches to be pushed to the default remote (like the behavior of `push.default=current`) and you also want the upstream tracking to be set. Workflows most likely to benefit from this option are simple central workflows where all branches are expected to have the same name on the remote.

## Ansible

### Cheat sheet

- Get a list of Ansible installed collections

        ansible-galaxy collection list

### Links
- Interpreter [discovery](https://docs.ansible.com/ansible/latest/reference_appendices/interpreter_discovery.html)
- Ansible Configuration [Settings](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings)

## Minikube

To set a default driver with `docker`:

    minikube config set driver docker

To add a local Docker registry:

    minikube addons enable registry

Restart Docker:

    sudo killall Docker && open /Applications/Docker.app

- Minikube [documentation](https://minikube.sigs.k8s.io/docs/)

# Some useful links

- 5 Ways to Manage Environment Variables with [direnv](https://www.sixfeetup.com/blog/direnv-manage-environment-variables)
