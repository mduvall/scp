_ = require 'underscore-plus'
exec = require('child_process').exec

module.exports =
  configDefaults:
    directory: []
    server: []
    serverDirectory: []

  activate: ->
    atom.workspaceView.command 'scp:remoteWrite', => @remoteWrite()

  remoteWrite: ->
    # Do the usual core:save command
    atom.workspaceView.saveActivePaneItem()

    # Must be a legit buffer (ie not the settings page)
    if atom.workspace.getActiveEditor()
      # Get the URI, cwd and directories for scp
      uri = atom.workspace.getActiveEditor().getUri()
      cwd = atom.project.getRootDirectory().path
      directory = atom.config.get('scp.directory')[0]
      server = atom.config.get('scp.server')[0]
      serverDirectory = atom.config.get('scp.serverDirectory')[0]
      filePath = uri.split(cwd)[1]
      matchesDirectory = new RegExp(cwd).exec(directory)

      if cwd && matchesDirectory
        cmd = "scp #{uri} #{server}:#{serverDirectory}#{filePath}"
        exec(cmd)
