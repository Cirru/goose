
require! \fs
require! \path

{goose} = require \./goose

show = console.log

files = process.argv[2 to]

convert = (name) ->
  # show \..converting
  fs.read-file name, \utf8 (err, code) ->
    throw err if err?
    res = goose code
    # show \writing res
    fs.write-file name.replace(/.gos/,".go"), res

render-file = (name) ->
  # show \rendering
  convert name
  fs.watch-file name, interval: 100, ->
    convert name

files.for-each render-file