;Write MeTTa code to solve the full 8 X 8 knight’s tour problem. This will
;require a lot of effort if all the move(X, Y) facts on the full chessboard
;are itemized. It is much better to create a set of eight predicates that
;capture the general rules for moving the knight on the full chessboard. You
;will also have to create a new representation for the squares on the board.
;Hint: consider a predicate containing the two element order pair, for
;example, state(Row, Column).

(=Board_size 8)
(= visited_pos ())

(=(moves ($X $Y) ($A $B))
  (or
    (or
      (or
        (or
          (and (== (+ $X 1) $A) (== (+ $Y 2) $B))
          (and (== (+ $X 1) $A) (== (- $Y 2) $B))
        )
        (and (== (- $X 1) $A) (== (+ $Y 2) $B))
      )
      (and (== (- $X 1) $A) (== (- $Y 2) $B))
    )
    (or
      (or
        (and (== (+ $X 2) $A) (== (+ $Y 1) $B))
        (and (== (+ $X 2) $A) (== (- $Y 1) $B))
      )
      (or
        (and (== (- $X 2) $A) (== (+ $Y 1) $B))
        (and (== (- $X 2) $A) (== (- $Y 1) $B))
      )
    )
  )
)

(= (valid_square $X $Y)
  (and
    (>= $X 0) (< $X Board_size)
    (>= $Y 0) (< $Y Board_size)
  )
)


(= (member_check $list $ele) 
(if (== $list ()) (False)
    (let* 
    (
    ($cur (car-atom $list))
    ($list1 (cdr-atom $list))
    )
    (if (== $cur $ele) (True) (member_check $list1 $ele))
    )
))

(= (visited $X $Y)
  (member_check visited_pos ($X $Y))
)
(= (knight_tour ($X $Y $N))
  (or
    (and (== $N (* Board_size Board_size)) (valid_square $X $Y))
    (and
      (valid_square $X $Y)
      (and (not (visited_pos $X $Y))
      (and (visited $X $Y) (knight_tour $X $Y (+ $N 1))))
    ) 
  )
)


!(knight_tour 0 0 1)

    







(= (visit $X $Y)
  (setq visited_pos (union-atom visited_pos (($X $Y))))
)
(= (unvisit $X $Y)
  (setq visited_pos (setdiff-atom visited_pos (($X $Y))))
)