module.exports =
class AtomShouldbeeView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('atom-shouldbee')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Atom ShouldBee Mode On!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
