%{
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

FILE* yyin;

%}

%union {
    int intval;
    char op;
}

%token <intval> NUMBER

%token <op> ADD MINUS MUL DIV
%token <op> LEFTPRT RIGHTPRT

%left ADD MINUS
%left MUL DIV
%right UMINUS





%%
line    :   line expr ';' {printf("\nConverted \n");}
        |   line ';'
        |
        ;
expr    :   expr ADD expr {printf("+ ");}
        |   expr MINUS expr {printf("- ");}
        |   expr MUL expr {printf("* ");}
        |   expr DIV expr {printf("/ ");}
        |   LEFTPRT expr RIGHTPRT
        |   MINUS expr %prec UMINUS {printf("-");}
        |   NUMBER  {printf("%d ", $1);}
        ;
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
                        yylval.intv
                        al=0;
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
                    yylval.intval = num; 
                    ungetc(t,yyin);
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
    fprintf(stderr, "%s\n", s);
}