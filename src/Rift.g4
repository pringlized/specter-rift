grammar Rift;

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
program    : statement* EOF ; // Start the program with any number of statements

statement
    : ifStatement
    | whileStatement
    | assignment
    | expr NEWLINE? // Any expression followed by an optional newline
    ;

ifStatement
    : IF expr COLON NEWLINE program (ELIF expr COLON NEWLINE program)* (ELSE COLON NEWLINE program)? 
    ; // Conditional block with optional elif/else branches

whileStatement
    : WHILE expr COLON NEWLINE program 
    ; // While loop with expression as condition

assignment
    : IDENTIFIER ASSIGN expr NEWLINE? // Variable assignment
    | IDENTIFIER PLUS_ASSIGN expr NEWLINE? // Increment assignment
    | IDENTIFIER MINUS_ASSIGN expr NEWLINE? // Decrement assignment
    ;

expr
    : term (op=('<' | '>' | '<=' | '>=' | '!=' | '==') term)* // Comparisons
    | additiveExpr // Expression with addition/subtraction
    | lazyExpr // Added lazy expression for lazy evaluation
    ;

lazyExpr
    : 'lazy' LPAREN expr RPAREN // Defining lazy expressions for deferred evaluation
    ; 

additiveExpr
    : term (op=('+' | '-') term)* 
    ; // Expression with addition or subtraction

term
    : factor (op=('*' | '/') factor)* 
    ; // Expression with multiplication or division

factor
    : IDENTIFIER
    | NUMBER
    | STRING
    | BOOL
    | NONE
    | LPAREN expr RPAREN
    ; // Basic data types and parenthesis-wrapped expressions
