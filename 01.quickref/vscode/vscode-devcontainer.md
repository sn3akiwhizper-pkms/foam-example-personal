---
template_version: 0.2
type: quick-ref
tags: something
keywords: somthing
foam_template:
	name: quick-ref-template
	description: Quick ref sheet for SOMETHING
---
# vscode-devcontainer

Created: 12/30/2022

*TOC*
- [Folder Locations](#folder-locations)
- [Default Config](#default-config)
- [Config Details](#config-details)
- [Features](#features)

## Folder Locations

- by default, mounts current folder to: `/workspaces/<foldername>`

## Default Config

```json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/python
{
	"name": "Python 3",
	"image": "mcr.microsoft.com/devcontainers/python:0-3.10",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	// "build": {
	// 	"dockerfile": "./Dockerfile",
	// 	"context": "../"
	// },
	"features": {
		"ghcr.io/devcontainers/features/anaconda:1": {}
	},

	// Features to add to the dev container. More info: https://containers.dev/features.
	// "features": {},

	// Use 'forwardPorts' to make a list of ports inside the container available locally.
	// "forwardPorts": [],

	// Use 'postCreateCommand' to run commands after the container is created.
	// "postCreateCommand": "pip3 install --user -r requirements.txt",

	// Configure tool-specific properties.
	"customizations": {
		// Configure properties specific to VS Code.
		"vscode": {
			// Set *default* container specific settings.json values on container create.
			"settings": {
				// "python.defaultInterpreterPath": "/opt/conda/bin/python",
			},
			// Add the IDs of extensions you want installed when the container is created.
			"extensions": [
				"ms-python.python",
				"ms-python.vscode-pylance",
                "ms-vscode-remote.remote-containers",
			]
		}
	}

	// Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
	// "remoteUser": "root"
}

```

## Config Details

- **name:** name of dev container
- **image:** container image to use
  - or **build:** define dockerfile/compose setup
- **features:** additional features to be installed
- **forwardPorts:** Use 'forwardPorts' to make a list of ports inside the container available locally.
- **postCreateCommand:** run commands after the container is created.
- **customizations:** Configure tool-specific properties.
  - **vscode:**

```json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/python
{

	// 
	"customizations": {
		// Configure properties specific to VS Code.
		"vscode": {
			// Set *default* container specific settings.json values on container create.
			"settings": {
				// "python.defaultInterpreterPath": "/opt/conda/bin/python",
			},
			// Add the IDs of extensions you want installed when the container is created.
			"extensions": [
				"ms-python.python",
				"ms-python.vscode-pylance",
                "ms-vscode-remote.remote-containers",
			]
		}
	}

	// Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
	// "remoteUser": "root"
}

```

## Features

- See info here: <https://github.com/devcontainers/features/pkgs/container/features>
- See list of features in repo packages: <https://github.com/orgs/devcontainers/packages?repo_name=features>
- create your own feature with this template: <https://github.com/devcontainers/feature-starter>
