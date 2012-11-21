
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
    show \res res
    res
  ret.reverse!

add-bracket = (list) ->

  dont-wrap = <[ case ]>
  round-wrap = <[ var const import ]>

  at-dont = no
  at-round = no
  dont-pos = 0

  indent = 0

  res = []
  list.for-each (line) ->
    n = count-indent line
    show \compare n, indent
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
        res.push line
        indent := indent - 1
    else
      res.push line
  res

exports.goose = (code) ->
  list = code.split "\n"
  list.push("")
  list = (mark-comment list)
  list = add-bracket list
  list.join \\n