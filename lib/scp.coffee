ScpView = require './scp-view'

module.exports =
  scpView: null

  activate: (state) ->
    @scpView = new ScpView(state.scpViewState)

  deactivate: ->
    @scpView.destroy()

  serialize: ->
    scpViewState: @scpView.serialize()
