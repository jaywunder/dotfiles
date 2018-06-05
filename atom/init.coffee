# coffeelint: disable=max_line_length
# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     editor = atom.workspace.getActivePaneItem()
#     file = editor?.buffer.file
#     console.log "saved #{file.path}!"

# execSync = require('child_process').execSync
# charArray = execSync('echo $PATH')
# process.env.PATH = (new TextDecoder("utf-8")).decode(charArray)

process.env.HOME = '/Users/jacob'
process.env.PATH =
  '/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/sbin:/usr/bin:/usr/local/git/bin:/Users/jacob/.cargo/bin:/usr/local/heroku/bin:/Users/jacob/bin'
