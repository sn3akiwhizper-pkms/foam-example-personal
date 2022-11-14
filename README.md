<img src="attachments/foam-icon.png" width=100 align="left">

# Personal FOAM Example

This repository contains an example demonstration of how I am personally using the FOAM VSCode extension for Personal Knowledge Management System (PKMS). As such this will be a very opinionated and probably random/chaotic structure and MAY NOT BE FOR EVERYBODY. It is loosely based around the Zettelkasten and Digital Garden PKMSs with a couple dashes of Mental Palace concepts sprinkled here and there.

## Typical Note/Research Process

1. Start a new year planner with the `yearly-planner` template
2. Start a new month planner with the `monthly-planner` template
3. Throughout the day if I have something I need to jot down, or if I am reading new topics that I want to take notes on I will start a new daily-note.

## Taking The Tour

NOTE: I have recorded a [Code Tour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour) for this project to help walk you through all the different aspects of Foam, especially those I commonly use. This is a extension I commonly use in my programming & development job so it may be unfamiliar to those not in that field of expertise. If you do not want to install this extension that is totally fine but you will have to explore the structure on your own without me holding your hand.

1. Clone/download this repository to your local system.
2. Open an empty window of VSCode
3. Click `File > Open Folder` and select the root folder of this repo
4. Navigate to the Extensions View `CTRL+SHIFT+X`
5. Sort the Extensions View using the keyword `@recommended` and install the extensions recommended for this workspace
6. Return to the Explorer View `CTRL+SHIFT+E`
7. Towards the bottom of the left side-bar you will see an Explorer panel titled "CODETOUR". Expand this view and select any of the recorded code tour topics you would like to understand the layout of my KMS system.

## Topics To Include In Tour

- daily notes filepath unable to be set based on date [src](https://foambubble.github.io/foam/user/features/note-templates#filepath-attribute). May be fixed in the future.
- note `type` set in the yaml with the templates is mostly used for coloring nodes in the graph (see settings.json)
- review foam templates in .foam/templates: <https://foambubble.github.io/foam/user/features/note-templates#filepath-attribute>
  - use common vscode snippets: <https://code.visualstudio.com/docs/editor/userdefinedsnippets#_variables>

## Other Foam Examples

I have created repos with example FOAM structures using various existing knowledge management systems for you to check out and possibly adopt/integrate into your own workflow:

- [Personal FOAM Structure](https://github.com/sn3akiwhizper/foam-example-personal)
- [FOAM with P.A.R.A.](https://github.com/sn3akiwhizper/foam-example-para)
- [FOAM with Zettelkasten](https://github.com/sn3akiwhizper/foam-example-zettelkasten)
- [FOAM with Johnny Decimal](https://github.com/sn3akiwhizper/foam-example-johnny-decimal)
- [FOAM with Decimal-Cutter](https://github.com/sn3akiwhizper/foam-example-decimal-cutter)
- [FOAM for Worldbuilding](https://github.com/sn3akiwhizper/foam-example-worldbuilding)
