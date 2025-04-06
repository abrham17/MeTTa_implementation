(= (concatenate $list1 $list2)
   (if (== (size-atom $list1) 0)
       $list2
       (let* (($head (car-atom $list1))
              ($tail (cdr-atom $list1))
              ($rest (concatenate $tail $list2)))
             (cons-atom $head $rest))))

(= (less $list $pivot $acc)
   (if (== (size-atom $list) 0)
       $acc
       (let* (($head (car-atom $list))
              ($tail (cdr-atom $list)))
             (if (< $head $pivot)
                 (less $tail $pivot (cons-atom $head $acc))
                 (less $tail $pivot $acc)))))

(= (greater-or-equal $list $pivot $acc)
   (if (== (size-atom $list) 0)
       $acc
       (let* (($head (car-atom $list))
              ($tail (cdr-atom $list)))
             (if (>= $head $pivot)
                 (greater-or-equal $tail $pivot (cons-atom $head $acc))
                 (greater-or-equal $tail $pivot $acc)))))

(= (quick-sort $list)
   (if (== (size-atom $list) 0)
       ()
       (let* (($pivot (car-atom $list))
              ($rest (cdr-atom $list))
              ($less (less $rest $pivot ()))
              ($greater-or-equal (greater-or-equal $rest $pivot ()))
              ($sorted-less (quick-sort $less))
              ($sorted-greater (quick-sort $greater-or-equal))
              ($with-pivot (cons-atom $pivot $sorted-greater)))
             (concatenate $sorted-less $with-pivot))))

!(quick-sort (34 53 23 12 34))