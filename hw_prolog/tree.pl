/*

Structurally identical binary trees

We represent a binary tree (we consider rooted, ranked and ordered trees) as

    - term empty if the tree is empty, or
    - as t(V, L, R), where V is the value in the given tree vertex and L and R are the left and right right subtree.

Write the predicate bt_identical(+-T1, +-T2), which decides whether the trees T1 and T2 are structurally identical, i.e. they differ only in the values in the vertices.

    bt_identical(empty, empty). → true.
    bt_identical(not_a_tree, empty). → false.
    bt_identical(t(1, empty, empty), t(2, empty, empty)). → true.
    bt_identical(t(1, t(2, empty, empty), empty), t(1, empty, empty)). → false.
    bt_identical(t(1, t(2, empty, empty), empty), Tree). → Tree = t(_, t(_, empty, empty), empty).
    bt_identical(t(1, t(2, empty, t(3, empty, t(4, empty, empty))), empty), t(2, Left, Right)). → Left = t(_, empty, t(_, empty, t(_, empty, empty))), Right = empty.
    bt_identical(t(4,3,2), Tree). → false.
*/


%bt_identical(+-T1, +-T2)
bt_identical(empty,empty).

bt_identical(t(_,L1,R1), t(_, L2, R2)) :-
    bt_identical(L1,L2),
    bt_identical(R1,R2).

