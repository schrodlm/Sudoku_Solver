/*
Odstranění druhého minima ze seznamu

Napište predikát without_second_min(+Lst, -Res), který pro seznam čísel Lst vrátí seznam čísel takový, že v něm nebudou žádné výskyty druhého minima ze seznamu Lst. Pokud v Lst nejsou alespoň 2 různá čísla, je predikát nesplnitelný.

    without_second_min([1,2,3,2,1], R). → R = [1,3,1].
    without_second_min([1,1], R). → false.
    without_second_min([1], R). → false.
    without_second_min([], R) → false.
    without_second_min([-5, -5, -5], R) → false.
    without_second_min([-5, -5, -10, -5, -10], R) → R = [-10, -10].
*/



without_second_min(L, Res) :-
    find_second_min(L, Second),
    ldelete(L, Second, Res).



find_second_min(L, Second) :-
    sort(L, [First | T]),
    ldelete([First | T], First, Res),
    Res = [Second | Tail].



%Delete from list
ldelete([], E, []).

%Found item to delete
% ! = cut (forbids backtracking)
ldelete([H|T], E, R) :-
    H = E,
    ldelete(T,H,R), !.

%Not found item to del
ldelete([H|T], E, [H|R]) :-
    ldelete(T,E,R).




%without_second_min()