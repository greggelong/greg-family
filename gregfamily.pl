female(angela).
female(betty).
female(dawn).
female(debbie).
female(ester).
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
