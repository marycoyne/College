numeral(0).
numeral(succ(X)) :- numeral(X).

pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

%incr
incr(null,f1(null)).              
incr(f0(X),f1(X)).                
incr(f1(X),f0(Y)) :- incr(X,Y).   

%legal
legal(f0(null)).                  
legal(Y) :- legal(X), incr(X,Y).  

%incrR
incR(X,Y):- legal(X), incr(X,Y).  

%add
add(null, X, X).
add(X, null, X).
add(f0(X), f0(Y), f0(Z)) :- add(X, Y, Z).
add(f1(X), f0(Y), f1(Z)) :- add(X, Y, Z).
add(f1(X), f10(Y), f0(Z)) :- add(X, Y, Z), incr(A, Z).

%mult
mult(null, _, f0(null)).
mult(_, null, f0(null)).
mult(f0(X), Y, Z) :- mult(X, f0(Y), Z).
mult(f1(X), Y, Z) :- mult(X, f0(Y), A), add(A, Y, Z).

%reverse
revers(P,RevP) :- revers(P, null, RevP).    
revers(null,Y, Y).                      
revers(f0(X), T, Y) :- revers(X,f0(T), Y).
revers(f1(X), T, Y) :- revers(X,f1(T), Y).

%normalize
normalize(null,f0(null)). 
normalize(f0(null),f0(null)).
normalize(X, Y) :- revers(X, Z), normalize2(Z, A), revers(A, Y). 
normalize2(f1(X), f1(X)). 
normalize2(f0(X), Y) :- normalize2(X, Y). 