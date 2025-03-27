(= (member_check $list $ele) 
(if (== $list ()) False
    (let* 
    (
    ($cur (car-atom $list))
    ($list1 (cdr-atom $list))
    )
    (if (== $cur $ele) True (member_check $list1 $ele))
    )
))
;!(cdr-atom (1 2 3))
!(member_check (1 2 3) 9)
