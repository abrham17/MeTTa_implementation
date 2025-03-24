
(= (member_check $element (:: $x $xs))
   (if (== $element $x)
       (true)
       (member_check $element $xs)
   ))

(= (task) (:: 8 (:: 3 (:: 10 (:: 17 ())))))
!(get-metatype (1 2 3))
! (to-tree (False (True False) False False))
!(to-tree (1 2 3))