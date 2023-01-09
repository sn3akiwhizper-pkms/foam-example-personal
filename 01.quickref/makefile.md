---
template_version: 0.2
type: quick-ref
tags: makefile, make
keywords: somthing
foam_template:
	name: quick-ref-template
	description: Quick ref sheet for makefiles
---
# makefile

Created: 12/18/2022

*TOC*
- [.PHONY](#phony)
- [wildcards](#wildcards)
- [variables](#variables)
	- [?=](#)
	- [:=](#-1)

## .PHONY

In a Makefile, the .PHONY directive is used to specify a list of targets that are not associated with actual files. These targets are called "phony targets."

```make
.PHONY: clean

clean:
        rm -f *.o
```

or define multiple phony targets, but cannot define multiple phony targets using pattern matching

```make
.PHONY: clean
.PHONY: build

clean:
        rm -f *.o

build:
        gcc -o myprogram main.c
```

## wildcards

- In this example, the PLUGINS variable is defined using the wildcard function, which expands to a list of all directories in the plugins/ directory. The TEST_PATHS variable is then defined using a substitution, which replaces each % with -s and the name of the plugin directory.

```make
PLUGINS = $(wildcard plugins/*)
TEST_PATHS = $(PLUGINS:%=-s %)

test:
    python -m unittest discover $(TEST_PATHS)
```

- You can also define a separate target for each plugin, if you want to run the unit tests for a specific plugin

```make
test-% :
    python -m unittest discover -s plugins/$*
```

## variables

### ?=

The ?= symbol is used to define a variable that is only set if it is not already defined. This can be useful if you want to allow the user to override the default value of a variable by specifying it on the command line.

### :=

The := symbol is used to define a variable that is immediately expanded and its value is stored. This is known as a recursive variable expansion.
