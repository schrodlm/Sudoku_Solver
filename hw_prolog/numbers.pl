

% numbers([1,2,3], 7) → true. (protože 1 + 3 * 2 = 7)
% numbers([3,4,1,2], 7) → true. (protože 4 + 3 = 7)
% numbers([1,7,7,3], 24) → true. (protože (7 - 3) * (7 - 1) = 24)
% numbers([75, 50, 2, 3, 8, 7], 812) → true. (protože (50 + 8) * 7 * 2 = 812)
% numbers([50, 10, 6, 25, 100, 75], 50) → true. (protože 50 už máme přímo v seznamu, nebo také protože 100 - 50 = 50, 100 - 75 + 25 = 50, …​))
% numbers([50, 10, 6, 25, 100, 75], 463) → true. (protože ((75 - (100 / 50)) * 6) + 25 = 463 nebo třeba (50 + 10) × 6 + 100 + (75 / 25) = 463)
% numbers([50, 10, 6, 25], 463) → false. (nejbližší možný výsledek je 465)
% numbers([50, 10, 6, 25], 17) → false.
% numbers([], 1) → false.
% numbers([75,75,10,8,10], 998) → false.


numbers([], _) :- fail.
numbers([L|T], E) :- T = [], L \= E, !, fail.

numbers(L, E) :-
    member(E,L),!,true.

% numbers(+List, +ToFind, -M)
%násobení
numbers([H|T], ToFind) :-
    
    member(ListElement1,[H|T]),
    member(ListElement2,[H|T]),

    ListElement1 \= ListElement2,
    AddedPrvek is ListElement1*ListElement2,
    
    ldelete([H|T],ListElement1, NewList),
    ldelete(NewList,ListElement2, NewList2),

    M = [AddedPrvek|NewList2],
    numbers(M, ToFind).

%dělení
numbers([H|T], ToFind) :-
        member(ListElement1,[H|T]),
        member(ListElement2,[H|T]),
        
        ListElement2 \= 0,
        MOD is mod(ListElement1, ListElement2),
        MOD = 0,
        ListElement1 \= ListElement2,
        DividedPrvek is ListElement1/ListElement2,
        ldelete([H|T],ListElement1, NewList),
        ldelete(NewList,ListElement2, NewList2),

        M = [DividedPrvek|NewList2],
        numbers(M, ToFind).

%sčítání
numbers([H|T], ToFind) :-
        
    member(ListElement1,[H|T]),
    member(ListElement2,[H|T]),

    ListElement1 \= ListElement2,
    AddedPrvek is ListElement1+ListElement2,
    
    ldelete([H|T],ListElement1, NewList),
    ldelete(NewList,ListElement2, NewList2),

    M = [AddedPrvek|NewList2],
    numbers(M, ToFind).


%odčítání
numbers([H|T], ToFind) :-
    
    member(ListElement1,[H|T]),
    member(ListElement2,[H|T]),

    ListElement1 \= ListElement2,

    DividedPrvek is ListElement1-ListElement2,
    ldelete([H|T],ListElement1, NewList),
    ldelete(NewList,ListElement2, NewList2),

    M = [DividedPrvek|NewList2],
    numbers(M, ToFind).



%Delete from list

%Found item to delete
% ! = cut (forbids backtracking)
ldelete([E|T], E, T) :- !.

%Not found item to del
ldelete([H|T], E, [H|R]) :-
    ldelete(T,E,R).


