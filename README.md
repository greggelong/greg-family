# My family knowledge base
## facts, rules and clauses in SWI-prolog

Here are some examples of how the syntax works.

cousin(greg,X).

greg is the cousin of whom.


spouse(nancy,X).

nancy is a spouse of whom.

You ask questions or query the knowledge-base.
The command prompt is '?'.

?. father(Who,greg).     
Who = kent

In prolog variables are upper case. You can use X or Who or any uppper case character or word. 
The variables pattern match with rules and facts to give the result.
Facts like greg or kent are are lower case.

For some questions eg:

father(kent,Who).

there are more than one match. Click the 'next' button to see other matches. 

Who = greg

Who = angela

[You can query this knowledgebase online on SWISH](https://swish.swi-prolog.org/p/greg%20family.pl)

[see: SWI-prolog website and Learn Prolog Now](https://www.swi-prolog.org/) 
