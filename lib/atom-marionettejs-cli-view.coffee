{SelectListView} = require 'atom-space-pen-views'
items =
  'type': [
    {
      label: 'ES6'
      command: 'es6'
    },
    {
      label: 'CommonJS'
      command: 'cjs'
    },
    {
      label: 'RequireJS'
      command: 'rjs'
    }
  ],
  'file': [
    {
      label: 'Layout'
      command: '--layout'
    },
    {
      label: 'Collection'
      command: '--collection'
    },
    {
      label: 'Model'
      command: '--model'
    },
    {
      label: 'Router'
      command: '--router'
    },
    {
      label: 'Object'
      command: '--object'
    },
    {
      label: 'Item View'
      command: '--itemView'
    },
    {
      label: 'Collection View'
      command: '--collectionView'
    },
    {
      label: 'Composite View'
      command: '--compositeView'
    },
    {
      label: 'Behavior'
      command: '--behavior'
    },
  ]

module.exports =
  class AtomMarionettejsCliView extends SelectListView
    mode: null

    viewForItem: (item) ->
      "<li data-command='#{item.command}'>#{item.label}</li>"

    showModalPanel: (@mode) ->
      @panel ?= atom.workspace.addModalPanel(item: this, visible: false)
      @addClass('overlay from-top')
      @setItems(items[@mode])
      @panel.show()
      @focusFilterEditor()

    cancelled: ->
      @panel.hide()

    getCommand: ->
      selectedItem = this.getSelectedItemView();
      return selectedItem.data().command;
