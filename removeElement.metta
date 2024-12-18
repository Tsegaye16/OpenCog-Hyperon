 ; Define the RemoveElement function to remove a specific element from the list
(: RemoveElement (-> Symbol List List))
(= (RemoveElement $Symbol ()) ()) ;; Removing from an empty list returns an empty list
(= (RemoveElement $Symbol (Cons $head $tail))
    (if (== $Symbol $head)
        (RemoveElement $Symbol $tail) ;; Skip the element if it matches the head
        (Cons $head (RemoveElement $Symbol $tail)))) ;; Otherwise, keep the head and remove from the tail

! (RemoveElement B (Cons A (Cons B (Cons C ())))) ;; Remove B from the list
 ; Out-put:
 ; [(Cons A (Cons C ()))]