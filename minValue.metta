 ; Define the MinValue function to find the minimum value in a list of numbers
(: MinValue (-> List Number))

(: Min (-> Number Number Number)) ;; Helper function to find the minimum of two numbers
(= (Min $a $b) (if (< $a $b) $a $b)) ;; Returns the smaller of the two numbers

 ; Handle an empty list by returning a special value like (empty) or a custom default
(= (MinValue ()) (empty)) ;; Return (empty) for empty lists

 ; If the list has one element, that element is the min value
(= (MinValue (Cons $head ())) $head)

 ; Recursively find the minimum value for a non-empty list
(= (MinValue (Cons $head $tail))
    (Min $head (MinValue $tail))) ;; Compare the head with the min of the tail

 ; Test cases
! (MinValue ()) ;; Min value of an empty list
! (MinValue (Cons 21 (Cons 11 (Cons 28 ())))) ;; Min value in the list (3 7 2)
 ; Out-put:
 ; []
 ; [11]