AtomShouldbeeView = require './atom-shouldbee-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomShouldbee =
  atomShouldbeeView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomShouldbeeView = new AtomShouldbeeView(state.atomShouldbeeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomShouldbeeView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-shouldbee:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomShouldbeeView.destroy()

  serialize: ->
    atomShouldbeeViewState: @atomShouldbeeView.serialize()

  toggle: ->
    console.log 'AtomShouldbee was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
