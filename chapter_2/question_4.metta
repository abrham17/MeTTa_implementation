;The first program
;Write a MeTTa program to count the elements in a list (a list within the list counts as one element).
(= (to-tree $expr)
   (case (get-metatype $expr)
      ((Expression
         (if (== $expr ()) Nil
             (Cons (to-tree (car-atom $expr))
                   (to-tree (cdr-atom $expr)))
         ))
       ($_ $expr)
      )
   )
)
(= (length_second Nil) 0)
(= (length_second (Cons $x $xs))
     (+ 1 (length_second $xs))
)

(= (length_first $list)
     (let $cons (to-tree $list)
          (length_second $cons)
     )
)


!(length_first (1 2 3))
; the second program
;Write a program to count the atoms in a list(count the elements within any sublist).
(= (length ()) 0)

(= (length ($list))
    (if (atom $x)
     (+ 1 (length $xs))
     (+ (+ 1 (length $x)) (length $xs)))
)

!(length (2 1 (2 4)))

(=(length ()) 0)
(= (length ($list))
     (if (== $list 0)
       (let*
          (cur )
       )   
     )
)