{View} = require 'atom'

module.exports =
class ScpView extends View
  @content: ->
    @div class: 'scp overlay from-top', =>
      @div "The Scp package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "scp:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ScpView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
