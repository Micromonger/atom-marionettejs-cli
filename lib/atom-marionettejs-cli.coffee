AtomMarionettejsCliView = require './atom-marionettejs-cli-view'
{CompositeDisposable, BufferedNodeProcess} = require 'atom'
{Directory} = require 'atom'
filePrefix = 'marionette-'
cli = require 'marionette-cli/lib/cli'

getPath = ->
  editor = atom.workspace.getActivePaneItem()
  file = editor?.buffer.file
  projectPath = atom.project.getPaths()[0]

  # if opened file or project doesn't exist
  if !file && !projectPath
    throw new Error ('Create project or open some file')

  # get path of opened file
  path = editor?.buffer.file.path
  # if no opened tabs
  if !path
    return projectPath

  regexp = /(.*\/).*/g
  # get path to file
  regexp.exec(path)[1]

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

    @modalPanel.confirmed = ->
      path = getPath()
      command = @getCommand();
      if @mode is 'file'
        fileName = filePrefix + command
        args = ['g', command, fileName, path]
      else
        args = ['s', command];

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
    appPath = getPath() + '/app'
    cli.run(['new', appPath]);
