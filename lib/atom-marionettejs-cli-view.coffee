{SelectListView} = require 'atom-space-pen-views'
items =
  'type': ['rjs', 'cjs', 'es6']
  'file': [
    '--layout',
    '--collection'
    '--model',
    '--router',
    '--object',
    '--itemView',
    '--behavior',
    '--collectionView',
    '--compositeView'
  ]

module.exports =
  class AtomMarionettejsCliView extends SelectListView
    mode: null

    viewForItem: (item) ->
      "<li>#{item}</li>"

    showModalPanel: (@mode) ->
      @panel ?= atom.workspace.addModalPanel(item: this, visible: false)
      @addClass('overlay from-top')
      @setItems(items[@mode])
      @panel.show()
      @focusFilterEditor()

    cancelled: ->
      @panel.hide()
