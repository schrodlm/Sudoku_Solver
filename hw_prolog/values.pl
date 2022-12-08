/*
Write a values_in(+-Values, +Universe) predicate that decides whether the Values list consists only of elements occurring in the Universe list. You can count on Universe to always be a list.

    values_in([], [1,2,3,4,5,6,7,8,9]). → true.
    values_in([1,2,3,2,1], [1,2,3,4,5,6,7,8,9]). → true.
    values_in([1,2,3,2,1], []). → false.
    values_in([], []). → true.
    values_in([aag,ppa,ag1,youShallNotPass,ma2], [ma2,aag,ppa,ag1]). → false.
    values_in([a,b,X,Y,c], [a,b,c]). →
        X = Y, Y = a ;
        X = a, Y = b ;
        X = a, Y = c ;
        X = b, Y = a ;
        X = Y, Y = b ;
        X = b, Y = c ;
        X = c, Y = a ;
        X = c, Y = b ;
        X = Y, Y = c ;
        false.

*/

values_in([], Universe).

values_in([H|T], Universe) :-
    member(H, Universe),
    values_in(T, Universe).
