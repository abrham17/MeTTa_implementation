

(= unique (:: $x $xs)
   (if (== $xs ())
       (:: $x ())
       (if (member_check $x $xs)
           (unique (:: $xs))
           (:: $x (unique $xs))
       )
   )
)

(= member_check ($element (:: $x $xs))
   (if (== $element $x)
       true
       (if (== $xs ())
           false
           (member_check $element (:: $xs))
       )
   )
)

!(unique (:: 2 (:: 2 (:: 2 (:: 3 (:: 4 (:: 1 ())))))))
