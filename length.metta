(: length (-> List Number))
(= (length ()) 0)
(= (length (cons $head $tail)) (+ 1 (length $tail)))

! (length (cons x (cons y (cons z ()))))
 ; Output = [3]
