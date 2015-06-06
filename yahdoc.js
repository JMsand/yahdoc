var yahdoc = (function () {
	   var PEG = require("pegjs");
		var path = require('path');
	   var filesystem = require("fs");
	
	  var yahdoc = {};
	  
      yahdoc.parseCommentJS = function (file){
		var grammarFile = path.join(__dirname + "/comment.pegjs")
		var grammar = readFile(grammarFile);
		var parser = PEG.buildParser(grammar);
		return parser.parse(readFile(file));
	  };
	   
	  var readFile = function (file){
			return filesystem.readFileSync(file).toString();
	  };
		
		return yahdoc;
})();

exports.parseCommentJS = yahdoc.parseCommentJS;
	
	





 

