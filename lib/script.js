var fs, path, goose, log, args, output, files, mark, convert, renderFile, slice$ = [].slice;
fs = require('fs');
path = require('path');
goose = require('./goose').goose;
log = console.log;
args = slice$.call(process.argv, 2);
output = void 8;
files = [];
mark = false;
args.forEach(function(name){
  if (mark) {
    output = name;
    return mark = false;
  } else if (name === "-o") {
    return mark = true;
  } else {
    return files.push(name);
  }
});
convert = function(name){
  return fs.readFile(name, 'utf8', function(err, code){
    var res, basename, endName;
    if (err != null) {
      throw err;
    }
    res = goose(code);
    if (output != null) {
      basename = path.basename(name);
      endName = path.join(output, basename);
    }
    return fs.writeFile(endName.replace(/.gos/, ".go"), res);
  });
};
renderFile = function(name){
  convert(name);
  return fs.watchFile(name, {
    interval: 100
  }, function(){
    return convert(name);
  });
};
files.forEach(renderFile);