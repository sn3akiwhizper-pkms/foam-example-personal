---
type: quick-ref
tags: VSCode 
keywords: TODO?
foam_template:
    description: Quick ref sheet for VSCode variables
---
# VSCode Variables Ref

*TOC*
- [Editor Variables](#editor-variables)
- [Snippet Variables](#snippet-variables)
  - [Editor Related](#editor-related)
  - [Date-Based](#date-based)
  - [Misc Snippet Variables](#misc-snippet-variables)
- [Environment Variables](#environment-variables)
- [Command Variables](#command-variables)
- [Misc](#misc)
  - [How can I know a variable's actual value?](#how-can-i-know-a-variables-actual-value)
  - [Variable Transforms](#variable-transforms)
- [Setting Window Title With Variables](#setting-window-title-with-variables)

With `$name` or `${name:default}`, you can insert the value of a variable. When a variable isn't set, its default or the empty string is inserted. When a variable is unknown (that is, its name isn't defined) the name of the variable is inserted and it is transformed into a placeholder.

## Editor Variables

- `${userHome}` - the path of the user's home folder
- `${workspaceFolder}` - the path of the folder opened in VS Code
- `${workspaceFolderBasename}` - the name of the folder opened in VS Code without any slashes (/)
- `${file}` - the current opened file
- `${fileWorkspaceFolder}` - the current opened file's workspace folder
- `${relativeFile}` - the current opened file relative to workspaceFolder
- `${relativeFileDirname}` - the current opened file's dirname relative to workspaceFolder
- `${fileBasename}` - the current opened file's basename
- `${fileBasenameNoExtension}` - the current opened file's basename with no file extension
- `${fileDirname}` - the current opened file's dirname
- `${fileExtname}` - the current opened file's extension
- `${cwd}` - the task runner's current working directory upon the startup of VS Code
- `${lineNumber}` - the current selected line number in the active file
- `${selectedText}` - the current selected text in the active file
- `${execPath}` - the path to the running VS Code executable
- `${defaultBuildTask}` - the name of the default build task
- `${pathSeparator}` - the character used by the operating system to separate components in file paths
- `${activeEditorLanguage}` - current language set for active editor window (found in [stack overflow](https://stackoverflow.com/questions/38703278/vscode-environment-variables-besides-workspaceroot) )

---

## Snippet Variables

### Editor Related

The following variables can be used:

- `TM_SELECTED_TEXT` The currently selected text or the empty string
- `TM_CURRENT_LINE` The contents of the current line
- `TM_CURRENT_WORD` The contents of the word under cursor or the empty string
- `TM_LINE_INDEX` The zero-index based line number
- `TM_LINE_NUMBER` The one-index based line number
- `TM_FILENAME` The filename of the current document
- `TM_FILENAME_BASE` The filename of the current document without its extensions
- `TM_DIRECTORY` The directory of the current document
- `TM_FILEPATH` The full file path of the current document
- `RELATIVE_FILEPATH` The relative (to the opened workspace or folder) file path of the current document
- `CLIPBOARD` The contents of your clipboard
- `WORKSPACE_NAME` The name of the opened workspace or folder
- `WORKSPACE_FOLDER` The path of the opened workspace or folder
- `CURSOR_INDEX` The zero-index based cursor number
- `CURSOR_NUMBER` The one-index based cursor number

### Date-Based

For inserting the current date and time:

- `CURRENT_YEAR` The current year
- `CURRENT_YEAR_SHORT` The current year's last two digits
- `CURRENT_MONTH` The month as two digits (example '02')
- `CURRENT_MONTH_NAME` The full name of the month (example 'July')
- `CURRENT_MONTH_NAME_SHORT` The short name of the month (example 'Jul')
- `CURRENT_DATE` The day of the month as two digits (example '08')
- `CURRENT_DAY_NAME` The name of day (example 'Monday')
- `CURRENT_DAY_NAME_SHORT` The short name of the day (example 'Mon')
- `CURRENT_HOUR` The current hour in 24-hour clock format
- `CURRENT_MINUTE` The current minute as two digits
- `CURRENT_SECOND` The current second as two digits
- `CURRENT_SECONDS_UNIX` The number of seconds since the Unix epoch

### Misc Snippet Variables

For inserting random values:

- `RANDOM` 6 random Base-10 digits
- `RANDOM_HEX` 6 random Base-16 digits
- `UUID` A Version 4 UUID

For inserting line or block comments, honoring the current language:

- `BLOCK_COMMENT_START` Example output: in PHP `/*` or in HTML `<!--`
- `BLOCK_COMMENT_END` Example output: in PHP `*/` or in HTML `-->`
- `LINE_COMMENT` Example output: in PHP `//`

---

## Environment Variables

You can also reference environment variables through the `${env:Name}` syntax (for example, `${env:USERNAME}`).

## Command Variables

If the predefined variables from above are not sufficient, you can use any VS Code command as a variable through the `${command:commandID}` syntax.

---

## Misc

The variable `${workspaceRoot}` was deprecated in favor of `${workspaceFolder}` to better align with Multi-root Workspace support.

### How can I know a variable's actual value?

One easy way to check a variable's runtime value is to create a VS Code task to output the variable value to the console. For example, to see the resolved value for ${workspaceFolder}, you can create and run (Terminal > Run Task) the following simple 'echo' task in tasks.json

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "echo",
      "type": "shell",
      "command": "echo ${workspaceFolder}"
    }
  ]
}
```

### Variable Transforms

Transformations allow you to modify the value of a variable before it is inserted. The definition of a transformation consists of three parts:

1. A regular expression that is matched against the value of a variable, or the empty string when the variable cannot be resolved.
2. A "format string" that allows to reference matching groups from the regular expression. The format string allows for conditional inserts and simple modifications.
3. Options that are passed to the regular expression.

The following example inserts the name of the current file without its ending, so from foo.txt it makes foo.

```ascii
${TM_FILENAME/(.*)\\..+$/$1/}
  |           |         |  |
  |           |         |  |-> no options
  |           |         |
  |           |         |-> references the contents of the first
  |           |             capture group
  |           |
  |           |-> regex to capture everything before
  |               the final `.suffix`
  |
  |-> resolves to the filename
```

Note: Transforms can be used on placeholders as well.

## Setting Window Title With Variables

```bash
Controls the window title based on the active editor. Variables are substituted based on the context:

${activeEditorShort}: the file name (e.g. myFile.txt).
${activeEditorMedium}: the path of the file relative to the workspace folder (e.g. myFolder/myFileFolder/myFile.txt).
${activeEditorLong}: the full path of the file (e.g. /Users/Development/myFolder/myFileFolder/myFile.txt).
${activeFolderShort}: the name of the folder the file is contained in (e.g. myFileFolder).
${activeFolderMedium}: the path of the folder the file is contained in, relative to the workspace folder (e.g. myFolder/myFileFolder).
${activeFolderLong}: the full path of the folder the file is contained in (e.g. /Users/Development/myFolder/myFileFolder).
${folderName}: name of the workspace folder the file is contained in (e.g. myFolder).
${folderPath}: file path of the workspace folder the file is contained in (e.g. /Users/Development/myFolder).
${rootName}: name of the opened workspace or folder (e.g. myFolder or myWorkspace).
${rootPath}: file path of the opened workspace or folder (e.g. /Users/Development/myWorkspace).
${appName}: e.g. VS Code.
${remoteName}: e.g. SSH
${dirty}: an indicator for when the active editor has unsaved changes.
${separator}: a conditional separator (" - ") that only shows when surrounded by variables with values or static text.
default: ${dirty}${activeEditorShort}${separator}${rootName}${separator}${appName}
```
