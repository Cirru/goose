
require! \fs
require! \path

{goose} = require \./goose

log = console.log

args = process.argv[2 to]

# log \args args

output = undefined
files = []
mark = no

args.for-each (name) ->
  if mark
    output := name
    mark := no
  else if name is "-o" then mark := yes
  else files.push name

# log \output output

convert = (name) ->
  # log \..converting name
  fs.read-file name, \utf8 (err, code) ->
    throw err if err?
    res = goose code
    # log \writing res
    # log \output output, name
    if output?
      basename = path.basename name
      # log "basename" basename, name
      end-name = path.join output, basename
    # log "end name: ", name
    fs.write-file end-name.replace(/.gos/,".go"), res

render-file = (name) ->
  # log \rendering
  convert name
  # log "convert" name
  fs.watch-file name, interval: 100, ->
    convert name

files.for-each render-file