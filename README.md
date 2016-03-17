# MarionetteJS CLI package for atom

Atom package for generate marionette files.
Based on [Marionette CLI](https://github.com/denar90/marionette-cli)

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

Note: Files and app will be placed in root of your project

###Example

####Generate app
- Run `Packages->atom-marionettejs-cli->generate marionettejs application`
- Application will be cloned into your project root directory.

####Generate app
- Run `Packages->atom-marionettejs-cli->generate marionettejs file->layout`
- Layout file with name `marionette--layout.js` will be placed into your project root directory.<br/>
File content:<br/>
```
export default Marionette.LayoutView.extend({
	//stuff
	//Doc - http://marionettejs.com/docs/v2.4.4/marionette.layoutview.html
});
```

###TODO
- write test
- improve generation list
- add feature to place files in different folders
