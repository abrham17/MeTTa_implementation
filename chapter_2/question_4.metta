;The first program
;Write a MeTTa program to count the elements in a list (a list within the list counts as one element).
(= (length_first()) 0)

(= (length_first (:: $x $xs))
     (+ 1 (length_first $xs))
)

!(length_first (:: 2 (:: 1 (:: 2 ()))))
; the second program
;Write a program to count the atoms in a list(count the elements within any sublist).
(= (length ()) 0)

(= (length (:: $x $xs))
    (if (atom $x)
     (+ 1 (length $xs))
     (+ (+ 1 (length $x)) (length $xs)))
)

!(length (:: 2 (:: 1 (:: 2 ()))))
