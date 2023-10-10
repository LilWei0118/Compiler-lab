```markdown
终结符：
数据类型
type -> 'int' 

数字
number -> '0' | '1 ' |...|'9'
nonzero -> '1' | '2' |...|'9'
digit -> nonzero number

标识符
id -> letter | letter id | letter number 
letter  ->  'a' | 'b' | ... | 'z' | 'A' | 'B' | ... | 'Z' 

变量声明
VarDecl -> type id
常量声明
ConstDecl -> 'const' type id
变量初始化
Valinit -> type id '=' expr 
常量初始化
Constinit -> 'const' type id '=' expr

语句
leftValue -> id
赋值语句
assignExpr -> leftValue '=' expr
循环语句
whileStmt -> 'while' '(' condition')' stmt
if语句
ifStmt -> 'if' '(' condition')' stmt 'else' stmt
块语句
block-> '{' BlockItem'}'
BlockItem-> Decl | stmt

stmt -> assignExpr | block |whileStmt | 'break' ';' |'continue'';'
|'return' Exp
表达式，保证逻辑运算优先级小于关系运算，小于算术运算
Exp          -> AddExp
Cond         -> LOrExp
LVal         -> Ident {'[' Exp ']'}
PrimaryExp   -> '(' Exp ')' | LVal | Number
unaryExpr -> digit | id
UnaryOp  -> '+' | '-' | '!'  
FuncRParams -> Exp { ',' Exp }
MulExp   -> unaryExpr| MulExp ('*' | '/' | '%') unaryExpr
AddExp   -> MulExp| AddExp ('+' | '−') MulExp
RelExp   -> AddExp| RelExp ('<' | '>' | '<=' | '>=') AddExp
EqExp    -> RelExp | EqExp ('==' | '!=') RelExp
LAndExp  -> EqExp| LAndExp '&&' EqExp
LOrExp   -> LAndExp| LOrExp '||' LAndExp
condition -> LOrExp

函数定义
VarDefList -> assignExpr | assignExpr, VarDefList
VarDef  -> type VarDefList

开始符号：
编译单元
CompUnit->CompUnit Decl |  ϵ
Decl -> VarDecl | ConstDecl |FuncDecl

```

