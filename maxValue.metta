 ; Define the MaxValue function to find the maximum value in a list of numbers
(: MaxValue (-> List Number))

(: Max (-> Number Number Number)) ;; Helper function to find the maximum of two numbers
(= (Max $a $b) (if (> $a $b) $a $b)) ;; Returns the larger of the two numbers

 ; Handle an empty list by returning a special value like (empty) or 0
(= (MaxValue ()) (empty)) ;; Return (empty) for empty lists

 ; If the list has one element, that element is the max value
(= (MaxValue (Cons $head ())) $head)

 ; Recursively find the maximum value for a non-empty list
(= (MaxValue (Cons $head $tail))
    (Max $head (MaxValue $tail))) ;; Compare the head with the max of the tail

 ; Test cases
! (MaxValue ()) ;; Max value of an empty list
! (MaxValue (Cons 3 (Cons 7 (Cons 9 ())))) ;; Max value in the list (3 7 2)
 ; Out-put
 ; []
 ; [9]