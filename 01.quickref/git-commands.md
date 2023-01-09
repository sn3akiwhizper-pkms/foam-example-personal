---
template_version: 0.2
type: quick-ref
tags: git
keywords: TODO?
foam_template:
  name: git-commands-ref
  description: Quick ref sheet for git commands
---
# Git Commands

*TOC*
- [Basic Workflow](#basic-workflow)
- [Branching](#branching)
- [Resetting \& Undoing Commits](#resetting--undoing-commits)
- [Submodules](#submodules)
	- [create submodule in existing repo](#create-submodule-in-existing-repo)
	- [clone repo with all submodules](#clone-repo-with-all-submodules)
- [.git internals](#git-internals)

## Basic Workflow

1. Clone existing repository: `git clone https://github.com/libgit2/libgit2`
   1. Or: convert existing local folder into git rep: `git init`
2. Make changes to files
3. Add (all) changes: `git add .`
4. Commit changes: `git commit -m "message1" -m "message2"
5. Push changes: `git push`

## Branching

1. Clone repository:
2. List branches:
3. Create new branch:
4. Make changes to files
5. Add (all) changes:
6. Commit changes:
7. Set remote and push changes:

## Resetting & Undoing Commits

- Undo local commits? `git reset --soft HEAD^`

## Submodules

- [submodule docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

### create submodule in existing repo

```bash
$ pwd
|	/projectfolder/
$ git submodule add https://github.com/chaconinc/DbConnector libs/DbConnector
|	Cloning into 'libs/DbConnector'...
|	remote: Counting objects: 11, done.
|	remote: Compressing objects: 100% (10/10), done.
|	remote: Total 11 (delta 0), reused 11 (delta 0)
|	Unpacking objects: 100% (11/11), done.
|	Checking connectivity... done.
$ git status
|	On branch master
|	Your branch is up-to-date with 'origin/master'.
|	Changes to be committed:
|		(use "git reset HEAD <file>..." to unstage)
|		new file:   .gitmodules
|		new file:   DbConnector
$ cat .gitmodules
|	[submodule "DbConnector"]
|		path = DbConnector
|		url = https://github.com/chaconinc/DbConnector
$ git commit -am 'Add DbConnector module'
|	[master fb9093c] Add DbConnector module
|	2 files changed, 4 insertions(+)
|	create mode 100644 .gitmodules
|	create mode 160000 libs/DbConnector
$ git push origin master
```

### clone repo with all submodules

- init submodule of already cloned: `git submodule init`
- update submodule of already cloned: `git submodule update`
- clone main with submodules: `git clone --recurse-submodules https://github.com/chaconinc/MainProject`

```bash
$ git clone https://github.com/chaconinc/MainProject
Cloning into 'MainProject'...
remote: Counting objects: 14, done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 14 (delta 1), reused 13 (delta 0)
Unpacking objects: 100% (14/14), done.
Checking connectivity... done.
$ cd MainProject
$ ls -la
total 16
drwxr-xr-x   9 schacon  staff  306 Sep 17 15:21 .
drwxr-xr-x   7 schacon  staff  238 Sep 17 15:21 ..
drwxr-xr-x  13 schacon  staff  442 Sep 17 15:21 .git
-rw-r--r--   1 schacon  staff   92 Sep 17 15:21 .gitmodules
drwxr-xr-x   2 schacon  staff   68 Sep 17 15:21 DbConnector
-rw-r--r--   1 schacon  staff  756 Sep 17 15:21 Makefile
drwxr-xr-x   3 schacon  staff  102 Sep 17 15:21 includes
drwxr-xr-x   4 schacon  staff  136 Sep 17 15:21 scripts
drwxr-xr-x   4 schacon  staff  136 Sep 17 15:21 src
$ cd DbConnector/
$ ls
$ git submodule init
Submodule 'DbConnector' (https://github.com/chaconinc/DbConnector) registered for path 'DbConnector'
$ git submodule update
Cloning into 'DbConnector'...
remote: Counting objects: 11, done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 11 (delta 0), reused 11 (delta 0)
Unpacking objects: 100% (11/11), done.
Checking connectivity... done.
Submodule path 'DbConnector': checked out 'c3f01dc8862123d317dd46284b05b6892c7b29bc'
```

## .git internals

```bash
$ ls .git/
config
description
HEAD
hooks/
info/
objects/
refs/
```

- `config` file contains your project-specific configuration options
- `description` file is used only by the GitWeb program, so don’t worry about it
- `HEAD` file points to the branch you currently have checked out
- `hooks/` directory contains your client- or server-side hook scripts
- `index` file is where Git stores your staging area information
- `info/` directory keeps a global exclude file for ignored patterns that you don’t want to track in a .gitignore file
- `objects/` directory stores all the content for your database
- `refs/` directory stores pointers into commit objects in that data (branches, tags, remotes and more)
