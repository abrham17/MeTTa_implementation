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
(= (merge $lst $acc)
   (let*
      (
         ($x (index-atom $lst 0))
         ($y (index-atom $lst 1))
      )
      (if (< $x $y)
         (union-atom ($x) $acc)
      )
      ($acc $y)
   )
)
!(merge (4) (3) ())
(= (merge-sort $lst $acc)
   (if (< (size-atom $lst) 2)
       $lst
       (
       (let* 
         (
         ($index (/ (size-atom $lst) 2))
         ($splitted (split-list $lst $index ()))
         ($left (car-atom $splitted))
         ($cdr (cdr-atom $splitted))
         ($right (car-atom $cdr))
         )
       (if (and (== (size-atom $left) 2 )  (== (size-atom $right) 2 )) 
         ((merge-sort $left $acc) (merge-sort $right $acc))     
         ;(merge $left $right $acc)
         (let*
           (
            ($merged (merge $left $acc) )
            ($merged2 (merge $right $acc))
            ($merged3 (merge (car-atom $merged) (car-atom $merged2)))
            ($merged4 (merge (index-atom $merged 1) (index-atom $merged2 1)))
            ($realmerged)
           )
           (

           )   
         )
   )       
   $acc
)
)
)
)

!(merge-sort (5 4 3 4) ())