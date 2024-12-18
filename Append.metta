 ; Define the Append function to append the element at the end.
(: Append (-> Symbol List List))
(= (Append $Symbol ()) (Cons $Symbol ())) ; Adding to an empty list creates a list
(= (Append $Symbol (Cons $head $tail))
    (Cons $head (Append $Symbol $tail))) ; Recursively add the element to the end

! (Append C (Cons A (Cons B ()))) ; Add C to the end of the list
 ; Output = [(Cons A (Cons B (Cons C ())))]