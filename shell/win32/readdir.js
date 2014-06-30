var fs = require('fs');
var path = require('path');

var root_path = process.argv[2];
var time = process.argv[3];
var overFileName = process.argv[4];
try{
  var startTime = new Date().getTime();
  function getAllFiles(root) {
    var files = fs.readdirSync(root);
    files.forEach(function(file) {
      var pathname = path.join(root, file),
        stat = fs.lstatSync(pathname);
      if (!stat.isDirectory()) {
        if (!time || stat.mtime.getTime() / 1000 > time) {
          console.log(pathname + '|');
        }
      } else {
        console.log(pathname);
        getAllFiles(pathname);
      }
    });
  }
  getAllFiles(root_path);
  fs.appendFileSync(overFileName,new Date().getTime()-startTime);
}catch(e){}