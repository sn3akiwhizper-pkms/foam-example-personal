---
template_version: 0.2
type: quick-ref
tags: vscode, launch, debug
keywords: python debugging
foam_template:
    name: vscode-launch-ref
    description: Quick ref sheet for VSCode launch.json
---
# VSCode Launch Information

*TOC*
- [Overview](#overview)
- [Python Configuration Options](#python-configuration-options)

## Overview

- notes focused on the `launch.json` setting file available to VSCode
- editor debugging: <https://code.visualstudio.com/docs/editor/debugging#_run-and-debug-view>
- python debuggin in vscode: <https://code.visualstudio.com/docs/python/debugging>

## Python Configuration Options

[Source](https://code.visualstudio.com/docs/python/debugging#_name)

- `name`: Provides the name for the debug configuration that appears in the VS Code dropdown list.
- `type`: Identifies the type of debugger to use; leave this set to python for Python code.
- `request`: Specifies the mode in which to start debugging:
  - `launch`: start the debugger on the file specified in program
  - `attach`: attach the debugger to an already running process. See Remote debugging for an example.
- `program`: Provides the fully qualified path to the python program's entry module (startup file). The value `${file}`, often used in default configurations, uses the currently active file in the editor. By specifying a specific startup file, you can always be sure of launching your program with the same entry point regardless of which files are open. For example:
  - example: `"program": "${workspaceFolder}/pokemongo_bot/event_handlers/__init__.py",`
- `module`: Provides the ability to specify the name of a module to be debugged, similarly to the -m argument when run at the command line.
- `python`: The full path that points to the Python interpreter to be used for debugging.
  - If not specified, this setting defaults to the interpreter selected for your workspace, which is equivalent to using the value ${command:python.interpreterPath}. To use a different interpreter, specify its path instead in the python property of a debug configuration.
  - Alternately, you can use a custom environment variable that's defined on each platform to contain the full path to the Python interpreter to use, so that no other folder paths are needed.
  - If you need to pass arguments to the Python interpreter, you can use the pythonArgs property.
- `pythonArgs`: Specifies arguments to pass to the Python interpreter using the syntax `"pythonArgs": ["<arg 1>", "<arg 2>",...]`.
- `args`: Specifies arguments to pass to the Python program. Each element of the argument string that's separated by a space should be contained within quotes
  - for example: `"args": ["--quiet", "--norepeat", "--port", "1593"]`
- `stopOnEntry`: When set to true, breaks the debugger at the first line of the program being debugged. If omitted (the default) or set to false, the debugger runs the program to the first breakpoint.
- `console`: Specifies how program output is displayed as long as the defaults for redirectOutput aren't modified.
  - Value >> Where output is displayed
  - "internalConsole" >> VS Code debug console. If redirectOutput is set to False, no output is displayed.
  - "integratedTerminal" (default) >>VS Code Integrated Terminal. If redirectOutput is set to True, output is also displayed in the debug console.
  - "externalTerminal" >> Separate console window. If redirectOutput is set to True, output is also displayed in the debug console.
- `purpose`: There is more than one way to configure the Run button, using the purpose option. Setting the option to debug-test, defines that the configuration should be used when debugging tests in VS Code. However, setting the option to debug-in-terminal, defines that the configuration should only be used when accessing the Run Python File button on the top-right of the editor (regardless of whether the Run Python File or Debug Python File options the button provides is used). Note: The purpose option can't be used to start the debugger through F5 or Run > Start Debugging.
- `autoReload`: Allows for the automatic reload of the debugger when changes are made to code after the debugger execution has hit a breakpoint. To enable this feature set {"enable": true} as shown in the following code.
  - ***Note**: When the debugger performs a reload, code that runs on import might be executed again. To avoid this situation, try to only use imports, constants, and definitions in your module, placing all code into functions. Alternatively, you can also use `if __name__=="__main__"` checks.
- `subProcess`: Specifies whether to enable subprocess debugging. Defaults to false, set to true to enable. For more information, see multi-target debugging.
- `cwd`: Specifies the current working directory for the debugger, which is the base folder for any relative paths used in code. If omitted, defaults to `${workspaceFolder}` (the folder open in VS Code).
  - example on web page
- `redirectOutput`: When set to true (the default for internalConsole), causes the debugger to print all output from the program into the VS Code debug output window. If set to false (the default for integratedTerminal and externalTerminal), program output is not displayed in the debugger output window.
  - This option is typically disabled when using "console": "integratedTerminal" or "console": "externalTerminal" because there's no need to duplicate the output in the debug console.
- `justMyCode`: When omitted or set to true (the default), restricts debugging to user-written code only. Set to false to also enable debugging of standard library functions.
- `django`: When set to true, activates debugging features specific to the Django web framework.
- `sudo`: When set to true and used with "console": "externalTerminal", allows for debugging apps that require elevation. Using an external console is necessary to capture the password.
- `pyramid`: When set to true, ensures that a Pyramid app is launched with the necessary pserve command.
- `env`: Sets optional environment variables for the debugger process beyond system environment variables, which the debugger always inherits. The values for these variables must be entered as strings.
- `envFile`: Optional path to a file that contains environment variable definitions. See Configuring Python environments - environment variable definitions file.
- `gevent`: If set to true, enables debugging of gevent monkey-patched code.
- `jinja`: When set to true, activates debugging features specific to the Jinja templating framework
