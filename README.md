# My family knowledge base
## fact, rules and clauses in SWI-prolog
see: SWI-prolog website and Learn Prolog Now 

cousin(greg,X).

greg is the cousin of whom.


spouse(nancy,X).

nancy is a spouse of whom.

[you can query this knowledgebase online on SWISH](https://swish.swi-prolog.org/p/greg%20family.pl)

?. father(Who,greg).     
Who = kent

In prolog variables are upper case. You can use X or Who or any uppper case character or word. 
The variables pattern match with rules and facts to give the result.
facts like greg or kent are are lower case.
