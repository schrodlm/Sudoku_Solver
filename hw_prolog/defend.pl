
/*

can_x_defend([o,o]). → true.
can_x_defend([x,x]). → false.
can_x_defend([x,x,o,o]). → true.
can_x_defend([x,o,o,x,x,o,x,o,o,x]). → false.
can_x_defend([o,o,x,x,x,x,o,o]). → true.
can_x_defend([o,x,x,o,o,x,x,x,o]). → true.
can_x_defend([x,o,x,x,o,x,o,x,x,o,x,x,o,x]). → false.
*/




can_x_defend(L) :-

    not(member(x, L)), !, true.


can_x_defend(L) :-
    removeFront(L,x, Res),
    can_o_win(Res).


can_x_defend(L) :-
    removeBack(L,x, Res),
    can_o_win(Res).


%========================================================



can_o_win(L) :-
    not(member(o,L)), !, fail.


can_o_win(L) :-
    removeFront(L, o, Res),
    not(Res = L),
    can_x_defend(Res).

can_o_win(L) :-
    removeBack(L, o, Res),
    not(Res = L),
    can_x_defend(Res).





removeFront([],_,[]).


%removeFront(+L, +ToDel, -Res)
removeFront([H|T], ToDel, R) :- 
    H=ToDel,
    removeFront(T,ToDel,Tmp),
    R = Tmp,
    !.

removeFront(L, X, R) :- 
    R = L.


removeBack([], []).


%removeBack(+L, +ToDel, +R)
removeBack(L, ToDel,R) :-
    lreverse(L, Res, []),
    removeFront(Res, ToDel, Res2),
    lreverse(Res2, R, []).



lreverse([],Z,Z).

 lreverse([H|T],Z,Acc) :- lreverse(T,Z,[H|Acc]).


