
is-empty = -> it.trim!.length is 0
get-indent = -> it.match(/^\s*/).0
count-indent = -> Math.floor (it.match(/^\s*/).0.length / 2)
show = console.log

mark-comment = (list) ->
  indent = ""
  ret = list.reverse!.map (line) ->
    res = line.trim-right!
    if is-empty line
      res = indent + "//"
    else
      indent := get-indent line
    # show \res res
    res
  ret.reverse!

add-bracket = (list) ->

  dont-wrap = <[ case ]>
  round-wrap = <[ var const import ]>

  at-dont = no
  at-round = no
  dont-pos = 0

  at-string = no

  indent = 0

  res = []
  list.for-each (line) ->
    if at-string
      if line.match(/^\s*\`/)?
        at-string := off
        # show "turn off", line
      res.push line
    else
      if line.match(/\`\s*$/)?
        # show "turn on", line
        at-string := on
      n = count-indent line
      # show \compare n, indent
      if n > indent
        if res[*-1]?
          key = res[*-1].match(/\s*(\S+)/).1
          if key in dont-wrap
            at-dont := yes
            dont-pos := n
          else if key in round-wrap
            res[*-1] += " ("
            at-round := yes
          else
            res[*-1] += " {"
        res.push line
        indent := n
      else if n < indent
        while n < indent
          curr = indent - 1
          if at-round
            gen = '  ' * curr + ")"
            res.push gen
            at-round := off
          else if at-dont and (indent is dont-pos)
            at-dont := off
          else
            gen = '  ' * curr + "}"
            res.push gen
          indent := indent - 1
        res.push line
      else
        res.push line
  res

blank-line = (list) ->
  list.map (line) ->
    if line.match /^\s*\/\/\s*$/ then ""
    else line

use-tab = (line) ->
  res = line.match /^(\s*)(.*)$/
  head = res.1.replace /\s\s/g "\t"
  content = res.2
  ret =head + content
  ret

exports.goose = (code) ->
  list = code.split "\n"
  list.push("")
  list = (mark-comment list)
  # show list
  list = add-bracket list
  # show list
  list = blank-line list
  list = list.map use-tab
  list.join \\n