/*
Removing the second minimum from the list

Write a predicate without_second_min(+Lst, -Res) that, for a list of numbers Lst,
returns a list of numbers such that there are no occurrences of the second minimum from the list Lst. 
If there are not at least 2 different numbers in Lst, the predicate is unfulfillable.

Examples:

    without_second_min([1,2,3,2,1], R). → R = [1,3,1].
    without_second_min([1,1], R). → false.
    without_second_min([1], R). → false.
    without_second_min([], R) → false.
    without_second_min([-5, -5, -5], R) → false.
    without_second_min([-5, -5, -10, -5, -10], R) → R = [-10, -10].
*/


%without_second_min(+L, -Res)
without_second_min(L, Res) :-
    find_second_min(L, Second),
    ldelete(L, Second, Res).



%find_second_min(+L, -Second)
find_second_min(L, Second) :-
    sort(L, [First | T]),
    ldelete([First | T], First, Res),
    Res = [Second | Tail].



%Delete from list
%ldelete(+L, -ElementToDelete, -ResultList)
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