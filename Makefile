.PHONY: help install setup

.DEFAULT_GOAL := help

help:
	@echo "Usage: make <target>"
	@echo -e "Available targets:\n"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)  | sort
	@echo ""

# Ansible
bootstrap: ## Run Ansible to bootstrap tools on Mac
	@ansible-playbook playbook/install.yml

tags: ## Show all tags
	@ansible-playbook playbook/install.yml --list-tags

# Git hooks
init-hooks: ## Init Git hooks
	@poetry install
	@poetry run pre-commit install

update-hooks:
	@poetry run pre-commit autoupdate

run-hooks: ## Run pre-commit hooks on the current repository for all files
	@poetry run pre-commit run --all-files

setup: ansible init-hooks ## Setup Mac tools and install Git hooks
