{
var functions = {};
var buffer = '';
}

start
  =  unit* {return functions;}

unit
  =  func
  /  string
  /  multi_line_comment
  /  single_line_comment
  /  any_char

func
  =  m:multi_line_comment spaces? id:identifier character* ""  {functions[id] = m;}

multi_line_comment
  =  "/*" 
     ( !{return buffer.match(/\*\//)} c:. {buffer += c;} )*               
     {
       var temp = buffer; 
       buffer = ''; 
       return "/*" + temp.replace(/\s+/g, ' ');
     }

single_line_comment
  =  "//" [^\r\n]*

identifier
  =  a:([a-z] / [A-Z] / "_") b:([a-z] / [A-Z] / [0-9] /"_")* {return a + b.join("");}

character 
 = [a-z] / [A-Z] / "_" / "."

spaces
  =  [ \t\r\n]+ {return "";}

string
  =  "\"" ("\\" . / [^"])* "\""
  /  "'" ("\\" . / [^'])* "'"

any_char
  =  .
