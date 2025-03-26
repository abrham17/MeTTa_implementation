;The first program
;Write a MeTTa program to count the elements in a list (a list within the list counts as one element).

(= (length_list ()) 0 )
(= (length_list $list)
    (let*
    (
        ($list1 (cdr-atom $list))
    )
        (+ 1 (length_list $list1))
    ) 
)
!(length_list (:: 2(:: 3(:: 1 ()))))

; =the second program
;Write a program to count the atoms in a list(count the elements within any sublist).

(= (length_listb ()) 0 )
(= (length_listb $list)
    (let*
    (
        ($head  (car-atom $list))
        ($list1 (cdr-atom $list))
    )
        (+ (length_listb $head) (length_listb $list1))
    )
) 
!(length_listb ((1 2) 3))