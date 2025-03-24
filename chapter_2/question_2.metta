(= (member_check $element ())
   ("There is no such element in the list:" $element)
)

(= (member_check $element (:: $x $xs))
   (if (== $element $x)
       ("There is an element with value in the list:" $element)
       (member_check $element $xs)
   ))

(= (task) (:: 8 (:: 3 (:: 10 (:: 17 ())))))

!(member_check 8 (task))
