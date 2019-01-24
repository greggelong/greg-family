female(angela).
female(betty).
female(dawn).
female(debbie).
female(ester).
female(kent_s).
female(mary).
female(nancy).
female(olivia).
female(sharon).
female(stacy).
female(diane).
female(donna).
male(bill).
male(bud).
male(dirk).
male(don).
male(greg).
male(kent).
male(kent_b).
male(lou).
male(pat).
male(paul).
male(don_jr).

parent(kent,olivia).
parent(kent,angela).
parent(kent,greg).
parent(nancy,greg).
parent(nancy,angela).
parent(pat, greg).
parent(pat, angela).

parent(lou, kent).
parent(ester, kent).
parent(lou, kent_b).
parent(ester, kent_b).
parent(lou, kent_s).
parent(ester, kent_s).

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

married(X,Y):- spouse(X,Y).
married(X,Y):- spouse(Y,X).




%% female cousin
%% ?- female(X),parent(Y,X),parent(Z,greg),parent(W,Y),parent(W,Z), Y \= Z.
%% ?- female(X),parent(Y,X),parent(Z,greg),parent(W,Y),parent(W,Z), not(Y=Z).

mother(X,Y):-
	parent(X,Y),
	female(X).

is_a_mother(X):-
	parent(X,_),
	female(X).


father(X,Y):-
	parent(X,Y),
	male(X).

is_a_father(X):-
	parent(X,_),
	male(X).
	
grandparent(GP,Y):-
	parent(X,Y), parent(GP,X).

sibling(X,Y):-
	parent(Z,X),
	parent(Z,Y), 
	X\=Y. %% or you can use dif(X,Y)

brother(X,Y):-
	sibling(X,Y),
	male(X).

sister(X,Y):-
	sibling(X,Y),
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
	
	

/*list_uncle_of(Y):-
	uncle(X,Y),
	write(X),
	nl,
	fail.
list_uncle_of(_).
this makes a endless loop you need to cut.
*/	
