---
template_version: 0.2
type: quick-ref
tags: vscode, tasks
keywords: TODO?
foam_template:
    name: vscode-tasks-ref
    description: Quick ref sheet for VSCode Tasks
---
# VSCode Tasks

- [Tasks documentation](https://code.visualstudio.com/docs/editor/tasks#_custom-tasks)
- [Commands documentation](https://code.visualstudio.com/api/references/commands)
- [Run command as task](https://stackoverflow.com/questions/57470525/how-can-i-run-a-vscode-command-as-a-task)
- vscode with macros: <https://mastery.games/post/level-up-coding-with-macros/>
- vscode extension macro-commander: <https://github.com/jeff-hykin/macro-commander>
  - last code change 3 years ago (2019)
- using vscode tasks for python: <https://realpython.com/advanced-visual-studio-code-python/#testing-your-python-code-in-visual-studio-code>
- full tasks.json schema: <https://code.visualstudio.com/docs/editor/tasks-appendix>

## Task Config

- `label`: The task's label used in the user interface.
- `type`: The task's type. For a custom task, this can either be shell or process.
  - If `shell` is specified, the command is interpreted as a shell command (for example: bash, cmd, or PowerShell).
  - If `process` is specified, the command is interpreted as a process to execute.
- `command`: The actual command to execute.
- `windows`: Any Windows specific properties. Will be used instead of the default properties when the command is executed on the Windows operating system.
- `group`: Defines to which group the task belongs. In the example, it belongs to the test group. Tasks that belong to the test group can be executed by running Run Test Task from the Command Palette.
- `presentation`: Defines how the task output is handled in the user interface. In this example, the Integrated Terminal showing the output is always revealed and a new terminal is created on every task run.
- `options`: Override the defaults for `cwd` (current working directory), `env` (environment variables), or `shell` (default shell). Options can be set per task but also globally or per platform. Environment variables configured here can only be referenced from within your task script or process and will not be resolved if they are part of your args, command, or other task attributes.
- `runOptions`: Defines when and how a task is run.

Example:

```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run tests",
      "type": "shell",
      "command": "./scripts/test.sh",
      "windows": {
        "command": ".\\scripts\\test.cmd"
      },
      "group": "test",
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    }
  ]
}
```

## VSCode Commands In Tasks

- [Command Variable docs](https://code.visualstudio.com/docs/editor/variables-reference#_command-variables)
- [Example](https://stackoverflow.com/questions/57470525/how-can-i-run-a-vscode-command-as-a-task):

```json
{
	"label": "run copyLinesDown command",
	//  "type": "shell",

	"command": "${command:editor.action.copyLinesDownAction}",

	// "command": "${command:extension.gist.open}"  // etc

	// "runOptions": {
	//   "runOn": "folderOpen"
	// }
},
```

Then a keybinding can be created for this task as seen below:

```json
{
	"key": "ctrl+h",            // binding of your choice
	"command": "workbench.action.tasks.runTask",
	"args": "run copyLinesDown command"
}
```
