AtomMarionettejsCliView = require './atom-marionettejs-cli-view'
{CompositeDisposable, BufferedNodeProcess} = require 'atom'
{allowUnsafeEval, allowUnsafeNewFunction} = require 'loophole'
# loophole was used because 'marionette-cli' package use rigger
# to build template rigger uses _.temlate() method from underscore
# _.temlate() use eval, atom genereate arror for this -
# Refused to evaluate a string as JavaScript because 'unsafe-eval'....
# solution https://discuss.atom.io/t/getting-unsafe-eval-with-loophole/16580/3
cli = allowUnsafeNewFunction -> require 'marionette-cli/lib/cli'
filePrefix = 'marionette-'

module.exports =
  modalPanel: null
  mode: null
  subscriptions: null

  activate: (state) ->
    @modalPanel = new AtomMarionettejsCliView()
    @subscriptions = new CompositeDisposable
    @subscriptions = atom.commands.add 'atom-workspace',
      'atom-marionettejs-cli:generate-app': => @attach('app')
      'atom-marionettejs-cli:generate-file': => @attach('file')
      'atom-marionettejs-cli:set-type': => @attach('type')

    @modalPanel.confirmed = (value) ->
      if @mode is 'file'
        fileName = filePrefix + value;
        args = ['g', value, fileName, atom.project.getPaths()[0]];
      else
        args = ['s', value];

      cli.run(args);
      @panel.hide()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()

  attach: (@mode) ->
    switch @mode
      when 'app'
        @generateApp()
      when 'file', 'type'
        @modalPanel.showModalPanel(@mode)

  generateApp: ->
    appPath = atom.project.getPaths()[0] + '/app'
    cli.run(['new', appPath]);
