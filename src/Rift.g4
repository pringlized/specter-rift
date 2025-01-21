grammar Grit;

// Lexer rules
IF         : 'if' ;
ELIF       : 'elif' ;
ELSE       : 'else' ;
WHILE      : 'while' ;
BOOL       : 'True' | 'False' ;
IDENTIFIER : [A-Za-z_][A-Za-z_0-9]* ;
NUMBER     : [0-9]+ ('.' [0-9]*)? ;
STRING     : '"' [^"]* '"' ;
NONE       : 'None' | 'null' ;
EQUALS     : '==' ;
ASSIGN     : '=' ;
PLUS_ASSIGN : '+=' ;
MINUS_ASSIGN: '-=' ;
PLUS       : '+' ;
MINUS      : '-' ;
TIMES      : '*' ;
DIVIDE     : '/' ;
LPAREN     : '(' ;
RPAREN     : ')' ;
LT         : '<' ;
GT         : '>' ;
LE         : '<=' ;
GE         : '>=' ;
NE         : '!=' ;
COLON      : ':' ;
NEWLINE    : ('\r'? '\n')+ ; // Handle multiple newlines
WS         : [ \t]+ -> skip ;
COMMENT    : '#' ~[\r\n]* -> skip ;  // Skip anything after `#` until end of line
MISMATCH   : . ;

// Parser rules
program    : statement* EOF ; // Updated to handle multiple statements

statement
    : ifStatement
    | whileStatement
    | assignment
    | expr NEWLINE?
    ;

ifStatement
    : IF expr COLON NEWLINE program (ELIF expr COLON NEWLINE program)* (ELSE COLON NEWLINE program)?
    ;

whileStatement
    : WHILE expr COLON NEWLINE program
    ;

assignment
    : IDENTIFIER ASSIGN expr NEWLINE?
    | IDENTIFIER PLUS_ASSIGN expr NEWLINE?
    | IDENTIFIER MINUS_ASSIGN expr NEWLINE?
    ;

expr
    : term (op=('<' | '>' | '<=' | '>=' | '!=' | '==') term)*
    | additiveExpr
    ;

additiveExpr
    : term (op=('+' | '-') term)*
    ;

term
    : factor (op=('*' | '/') factor)*
    ;

factor
    : IDENTIFIER
    | NUMBER
    | STRING
    | BOOL
    | NONE
    | LPAREN expr RPAREN
    ;
