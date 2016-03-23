# MarionetteJS CLI package for atom

Atom package for generate marionette files.
Based on [MarionetteJS CLI](https://github.com/denar90/marionette-cli)

![A screenshot of your package](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)

##Features
Add menu items to your Atom (Packages->atom-marionettejs-cli)
- Generate app skeleton (best practices)
  - [RequireJS](https://github.com/davidsulc/structuring-backbone-with-requirejs-and-marionette) example from David Sulc
  - [CommonJS](https://github.com/samccone/marionette-browserify) example from Sam Saccone
  - [ES6](https://github.com/thejameskyle/marionette-wires) example from James Kyle

- Generate backbone/marionette files
  - Model
  - Collection
  - ItemView
  - CollectionView
  - CompositeView
  - LayoutView
  - Behavior
  - Object
  - Router
- Set module formats (RequireJS, CommonJS, ES6). Setting module type you choose module format for generated files.

####Where can I find generated file?
If any file opened in editor - generated `backbone.marionette` file will be placed to the same folder as your active opened file.

Or

File will be placed in root of your project if any files were opened in your editor.

###Example

####Generate app
- Run `Packages->atom-marionettejs-cli->generate marionettejs application`

Or

- `Click right mouse btn -> generate marionettejs application`

####Generate file
- Run `Packages->atom-marionettejs-cli->generate marionettejs file->layout`
- Layout file with name `marionette--layout.js` will be created.

`ES6` file content:

```Javascript
export default Marionette.LayoutView.extend({
	//stuff
	//Doc - http://marionettejs.com/docs/v2.4.4/marionette.layoutview.html
});
```
[more](https://github.com/denar90/marionette-cli/blob/master/examples.md#es6)

`CommonJS` file content:

```
"use strict";
var LayoutView = Marionette.LayoutView.extend({
	//stuff
	//Doc - http://marionettejs.com/docs/v2.4.4/marionette.layoutview.html
});

module.exports = LayoutView;
```
[more](https://github.com/denar90/marionette-cli/blob/master/examples.md#commonjs)

`RequireJS` file content:

```
define('layout', ['marionette'], function (Marionette) {
	"use strict";
	var LayoutView = Marionette.LayoutView.extend({
		//stuff
		//Doc - http://marionettejs.com/docs/v2.4.4/marionette.layoutview.html
	});

	return LayoutView;
});
```
[more](https://github.com/denar90/marionette-cli/blob/master/examples.md#requirejs)

###TODO
- write tests
