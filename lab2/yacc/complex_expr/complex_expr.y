%{
/*********************************************
将所有的词法分析功能均放在 yylex 函数内实现，为 +、-、*、\、(、 ) 每个运算符及整数分别定义一个单词类别，在 yylex 内实现代码，能
识别这些单词，并将单词类别返回给词法分析程序。
实现功能更强的词法分析程序，可识别并忽略空格、制表符、回车等
空白符，能识别多位十进制整数。
YACC file
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>

#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex();
void yyerror(const char * s);

FILE* yyin;

%}

%token NUMBER

%token ADD MINUS MUL DIV
%token LEFTPRT RIGHTPRT

%left ADD MINUS
%left MUL DIV
%right UMINUS         

%%
line    :       line expr ';' {printf("%f\n", $2);}
        |       line ';'
        |
        ;
expr    :       expr ADD expr   { $$ = $1 + $3; }
        |       expr MINUS expr   { $$ = $1 -$3; }
        |       expr MUL expr  {$$ = $1 * $3; }
        |       expr DIV expr {$$ = $1 / $3;}
        |       LEFTPRT expr  RIGHTPRT {$$ = $2;}
        |       MINUS expr %prec UMINUS   {$$ =-$2;}//此处使用负号的优先级
//        |       DIGIT   {$$=$1;}
        |       NUMBER  {$$=$1;}
        ;

// DIGIT   :       NUMBER             {$$=$1;}
//         |       NONZERO NUMBER        {$$=$1*10+$2;}
//         ;
// NUMBER  :       '0'               {$$=0.0;}
//         |       NONZERO        {$$=$1;}
//         ;

// NONZERO :       '1'         {$$=1.0;}
//         |       '2'         {$$=2.0;}
//         |       '3'         {$$=3.0;}
//         |       '4'         {$$=4.0;}
//         |       '5'         {$$=5.0;}
//         |       '6'         {$$=6.0;}
//         |       '7'         {$$=7.0;}
//         |       '8'         {$$=8.0;}
//         |       '9'         {$$=9.0;}//这里的NUMBER被定义为token，所以不能再次定义为非终结符
//         ;
    

%%

            int main(void)
        {
            yyin = stdin;
            yyparse();
            return 0;
        }
        int yylex()
        {

            int t;
            while (1)
            {
                t = getchar();

                if(t=='0'){
                    if(isdigit(t=getchar()))
                    {
                        printf("eeror: 0开头的数字不合法");
                        exit(1);
                    }
                    else
                    {
                        yylval=0;
                        ungetc(t,yyin);
                        return NUMBER;
                    }
                }
               if (isdigit(t))
                {
                    int num = t - '0';
                    while (isdigit(t = getchar()))
                    {
                         num = num * 10 + t - '0';
                     }
                    yylval = num; // extern YYSTYPE yylval;
                    ungetc(t,yyin);//这里必须将取出来的t回退给stdin,为了下一次调用yylex()的时候能够读取到这个t
                   // return t;
                   return NUMBER;
                }

                else if (t == '+')
                {
                    return ADD;
                }
                else if (t == '-')
                {
                    return MINUS;
                }
                else if (t == '*')
                {
                    return MUL;
                }
                else if (t == '/')
                {
                    return DIV;
                }
                else if (t == '(')
                {
                    return LEFTPRT;
                }
                else if (t == ')')
                {
                    return RIGHTPRT;
                }
                else if (t == '\n' || t == '\t' || t == ' ')
                {
                    continue;
                }
                else {
                    return t;
                }
            }
        }

        void yyerror(const char *s)
        {
            fprintf(stderr, "Parse error: %s\n", s);
        }