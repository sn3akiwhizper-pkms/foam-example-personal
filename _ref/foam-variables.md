---
type: quick-ref
tags: foam
keywords: TODO?
foam_template:
    description: Quick ref sheet for Foam variables
---
# Foam Variables

- `$FOAM_TITLE` The title of the note. If used, Foam will prompt you to enter a title for the note.
  - `resolveFoamTitle();`
- `$FOAM_SLUG` The sluggified title of the note (using the default github slug method). If used, Foam will prompt you to enter a title for the note unless FOAM_TITLE has already caused the prompt.
  - `toSlug(await this.resolve(new Variable('FOAM_TITLE')));`
- `$FOAM_SELECTED_TEXT` Foam will fill it with selected text when creating a new note, if any text is selected. Selected text will be replaced with a wikilink to the new note.
  - `Promise.resolve(resolveFoamSelectedText());`
- `FOAM_DATE_*` Foam-specific versions of VS Code’s datetime snippet variables. Prefer these versions over VS Code’s.
  - Example value calculated on October 29, 2022 around 01:34PM PST
  - `$FOAM_DATE_YEAR` 2022
    - `String(this.foamDate.getFullYear())`
  - `$FOAM_DATE_YEAR_SHORT` 22
    - `String(this.foamDate.getFullYear()).slice(-2)`
  - `$FOAM_DATE_MONTH` 10
    - `String(this.foamDate.getMonth().valueOf() + 1).padStart(2, '0')`
  - `$FOAM_DATE_MONTH_NAME` October
    - `foamDate.toLocaleString('default', { month: 'long' })`
  - `$FOAM_DATE_MONTH_NAME_SHORT` Oct
    - `foamDate.toLocaleString('default', { month: 'short' })`
    - Possibles: Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
  - `$FOAM_DATE_DATE` 29
    - `String(this.foamDate.getDate().valueOf()).padStart(2, '0')`
  - `$FOAM_DATE_WEEK` 43
    - needs to calculate this [here](https://github.com/foambubble/foam/blob/master/packages/foam-vscode/src/services/variable-resolver.ts#L169)
  - `$FOAM_DATE_DAY_NAME` Saturday
    - `foamDate.toLocaleString('default', { weekday: 'long' })`
  - `$FOAM_DATE_DAY_NAME_SHORT` Sat
    - `foamDate.toLocaleString('default', { weekday: 'short' })`
    - Possibles: TODO
  - `$FOAM_DATE_HOUR` 01
    - `String(this.foamDate.getHours().valueOf()).padStart(2, '0')`
  - `$FOAM_DATE_MINUTE` 34
    - `String(this.foamDate.getMinutes().valueOf()).padStart(2, '0')`
  - `$FOAM_DATE_SECOND` 14
    - `String(this.foamDate.getSeconds().valueOf()).padStart(2, '0')`
  - `$FOAM_DATE_SECONDS_UNIX`
    - `(this.foamDate.getTime() / 1000).toString().padStart(2, '0')`

## Foam Front Matter

```yaml
other_settigns: "must go above foam settings"
foam_template:
  name: My Note Template
  description: This is my note template
  filepath: `journal/$FOAM_TITLE.md`
```
