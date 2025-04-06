(= (split-list $list $index $accum)
   (if (> $index 0)
      (let*(
         ($head (car-atom $list))
         ($tail (cdr-atom $list))
         ($newAccum (union-atom $accum ($head)))
      )
         (split-list $tail (- $index 1) $newAccum)
      )
      ($accum $list)
   )
)
(= (merge $list_left $list_right $acc)
   (if (and (> (size-atom $list_left) 0) (> (size-atom $list_right) 0))
   (let *
      (
         ($ele_left (car-atom $list_left))
         ($left_tail (cdr-atom $list_left))
         ($ele_right (car-atom $list_right))
         ($right_tail (cdr-atom $list_right))
         ($acc_right (if ( < $ele_left $ele_right)
            (union-atom $acc ($ele_left) )
            (union-atom $acc ($ele_right))
         ))
      )
      (if (< $ele_left $ele_right)
         (merge $left_tail $list_right $acc_right)
         (merge $list_left $right_tail $acc_right)
      )
   )
   (if (> (size-atom $list_right) 0)
       (union-atom $acc $list_right )
       (union-atom $acc $list_left )
   )
   )
   $acc
)
!(merge (1) (2) ())

(= (merge-sort $lst $acc)
   (if (< (size-atom $lst) 2)
       $lst
       (
       (let* 
         (
         ($index (/ (size-atom $lst) 2))
         ($splitted (split-list $lst $index ()))
         ($left (car-atom $splitted))
         ($right (index-atom $splitted 1))
         )
         (let* 
            (($sorted_left (merge-sort $left $acc))
            ($sorted_right (merge-sort $right $acc)))     
         (merge $sorted_left $sorted_right $acc)
         )
   )       
   $acc
)
)
)

!(merge-sort (5 4 3 4 3 4) ())