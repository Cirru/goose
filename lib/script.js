var fs, path, goose, show, files, convert, renderFile, slice$ = [].slice;
fs = require('fs');
path = require('path');
goose = require('./goose').goose;
show = console.log;
files = slice$.call(process.argv, 2);
convert = function(name){
  return fs.readFile(name, 'utf8', function(err, code){
    var res;
    if (err != null) {
      throw err;
    }
    res = goose(code);
    return fs.writeFile(name.replace(/.gos/, ".go"), res);
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