


% trilist([a,2,a,2,a,2]) → true.
% trilist([1,2,1,2]) → false.
% trilist([1,2,1,2,1,2,1,2]) → false.
% trilist([1,2,3,1,2,4]) → false.
% trilist([1,2,3,4,5,1,2,3,4,5,1,2,3,4,5]) → true.
% trilist([1,1,1]) → true.
% trilist([]) → true.
% trilist([1,1]) → false.
% trilist([1]) → false.
% trilist([1,X,1,X,1,X]) → true.
% trilist([1,X,1,X]) → false.
% trilist([1,X,1,X,Y,2]) → X = 2, Y = 1.

llenght([], 0).

llenght([_|T], R) :-
    llenght(T,Tmp),
    R is Tmp + 1.

app([], E, E).


%Recursion
app([Head|Tail], E, [Head|Tmp]) :-
    app(Tail, E, Tmp).
    

trilist(L) :-
    llenght(L, Size),
    Size >= 3,
    MOD is mod(Size, 3),
    MOD = 0,
    divide(L,X,Y,Z),
    X = Y,
    Y = Z.



    %   Myšlenka, zkouším rozdělat všema možnýma způsobama, a jen když to splnuje podminku
    %   ,že ty prvky jsou 
    %   append umí rozdělit list na všechny možnosti když ho aplikuju takto
    %   app(-X,-T, +L). 
    divide( L , X , Y , Z ) :-
        app(X,T,L)               , % split X off as a prefix of the source list L
        app(Y,Z,T)               , % divide the remainder (T) into a prefix Y and suffix Z
        llenght(X,X1)                , % compute the length of X
        llenght(Y,Y1)                , % compute the length of Y
        llenght(Z,Z1)                , % compute the length of Z
        min_max([X1,Y1,Z1],Min,Max) , % determine the shortest and longest such length
        Max - Min =< 1,!.              % and ensure that the delta is 1 or less


      min_max([],0,0) .
      min_max([H|T],Min,Max) :-
        min_max(T,H,H,Min,Max)
        .
      
      min_max([],Min,Max,Min,Max) .
      min_max([H|T], T1 , T2 , Min , Max ) :-
        ( H < T1 -> T3 = H ; T3 = T1 ), %if klazule v prologu
        ( H > T2 -> T4 = H ; T4 = T2 ),
        min_max(T,T3,T4,Min,Max).



