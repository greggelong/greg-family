female(angela).
female(betty).
female(dawn).
female(debbie).
female(ester).
female(ellen).
female(mary).
female(nancy).
female(olivia).
female(sharon).
female(stacy).
female(diane).
female(donna).
female(tami).
female(jennifer).
female(jen).
female(marijana).
female(simone).

male(bill).
male(bud).
male(dirk).
male(don).
male(greg).
male(kent).
male(stuart).
male(lou).
male(pat).
male(paul).
male(don_jr).
male(daniel).
male(joseph).
male(tim).
male(kevin).

parent(kent,olivia).
parent(jennifer,olivia).
parent(jennifer,simone).
parent(kent,angela).
parent(kent,greg).
parent(nancy,greg).
parent(nancy,angela).
%parent(pat, greg).  make a step father and step mother rule
%parent(pat, angela).
parent(pat,tim).
parent(pat,kevin).

parent(lou, kent).
parent(ester, kent).
parent(lou, stuart).
parent(ester, stuart).
parent(lou, ellen).
parent(ester, ellen).

parent(ellen, daniel).
parent(ellen, joseph).
parent(ellen, tami).


parent(bud, nancy).
parent(bud, betty).
parent(bud, bill).
parent(mary, nancy).
parent(mary, betty).
parent(mary, bill).

parent(sharon, stacy).
parent(sharon, paul).
parent(bill, stacy).
parent(bill, paul).

parent(don, dirk).
parent(don, dawn).
parent(don, debbie).
parent(don,don_jr).
parent(don,diane).
parent(don,donna).
parent(betty, dirk).
parent(betty, dawn).
parent(betty, debbie).
parent(betty,don_jr).
parent(betty,diane).
parent(betty,donna).

%% chapter 5 adventure in prolog two way door problem

spouse(ester,lou).
spouse(mary,bud).
spouse(betty,don).
spouse(sharon,bill).
spouse(nancy,kent).
spouse(nancy, pat).
spouse(jennifer,kent).
spouse(jen,angela).

part(marijana,greg).


married(X,Y):- spouse(X,Y).
married(X,Y):- spouse(Y,X).

partner(X,Y):- part(X,Y).
partner(X,Y):- part(Y,X).




%% female cousin
%% ?- female(X),parent(Y,X),parent(Z,greg),parent(W,Y),parent(W,Z), Y \= Z.
%% ?- female(X),parent(Y,X),parent(Z,greg),parent(W,Y),parent(W,Z), not(Y=Z).

mother(X,Y):-
	parent(X,Y),
	female(X).

step_mother(X,Y):-
	parent(Z,Y),
	married(Z,X),
	female(X),
	not(mother(X,Y)).	

is_a_mother(X):-
	parent(X,_),
	female(X).


father(X,Y):-
	parent(X,Y),
	male(X).

step_father(X,Y):-
	parent(Z,Y),
	married(Z,X),
	male(X),
	not(father(X,Y)).


is_a_father(X):-
	parent(X,_),
	male(X).
	
grandparent(GP,Y):-
	parent(X,Y), parent(GP,X).

sibling(X,Y):-
	parent(Z,X),
	parent(Z,Y), 
	X\=Y. %% or you can use dif(X,Y)

step_sibling(X,Y):-
	parent(Z,X),
	married(Z,W),
	parent(W,Y),
	X\=Y,
	not(sibling(X,Y)).

brother(X,Y):-
	sibling(X,Y),
	male(X).

step_brother(X,Y):-
	step_sibling(X,Y),
	male(X).	

sister(X,Y):-
	sibling(X,Y),
	female(X).

step_sister(X,Y):-
	step_sibling(X,Y),
	female(X).	


cousin(X,Y):-
	parent(Z,X),
	sibling(Z,W),
	parent(W,Y).

uncle(X,Y):-
	parent(Z,Y),
	sibling(Z,X),
	male(X).

uncle(X,Y):-
	%aunt(Z,Y), define aunt as parent sib to avoid endless backtracking
	married(X,Z),
    parent(W,Y),
	sibling(W,Z),
	female(Z).

		

aunt(X,Y):-
	parent(Z,Y),
	sibling(Z,X),
	female(X).

aunt(X,Y):-
	%uncle(Z,Y), new defined non recurs
	married(X,Z),
	parent(W,Y),
	sibling(W,Z),
	male(Z).
	
	

list_uncle_of(Y):-
	uncle(X,Y),
	write(X),
	nl,
	fail.
list_uncle_of(_).
 