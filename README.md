### List Operations in MeTTa

This README provides an overview of basic list operations implemented in MeTTa. These include `Append`, `MaxValue`, `MinValue`, and `RemoveElement`.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Operations](#operations)
   - [Append](#append)
   - [Max-Value](#max-value)
   - [Min-Value](#min-value)
   - [Remove-Element](#remove-element)
3. [Examples](#examples)

---

## Introduction

This project demonstrates how to perform basic operations on lists in **MeTTa**, a language for reasoning and pattern-matching computations. These operations are foundational for many functional programming tasks.

---

## Operations

### 1. **Append**

Combines two lists into one by appending the second list to the first.

**Definition**:

```mett
 ; Define the Append function to append the element at the end.
(: Append (-> Symbol List List))
(= (Append $Symbol ()) (Cons $Symbol ())) ; Adding to an empty list creates a list
(= (Append $Symbol (Cons $head $tail))
    (Cons $head (Append $Symbol $tail))) ; Recursively add the element to the end

! (Append C (Cons A (Cons B ()))) ; Add C to the end of the list
 ; Output = [(Cons A (Cons B (Cons C ())))]
```

### 2. **MaxValue**

Finds the maximum value in a list of numbers.

**Definition**:

```mett
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
```

### 3. **MinValue**

Finds the minimum value in a list of numbers.

**Definition**:

```mett
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
```

### 4. **RemoveElement**

Removes all occurrences of a specific element from a list.

**Definition**:

```mett
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
```

---

## Examples

### 1. **Append**

```mett
! (Append C (Cons A (Cons B ()))) ; Add C to the end of the list

```

**Output**:

```mett
[(Cons A (Cons B (Cons C ())))]
```

### 2. **MaxValue**

```mett
! (MaxValue ()) ;; Max value of an empty list
! (MaxValue (Cons 3 (Cons 7 (Cons 9 ())))) ;; Max value in the list (3 7 2)

```

**Output**:

```mett
 []
 [9]
```

### 3. **MinValue**

```mett
! (MinValue ()) ;; Min value of an empty list
! (MinValue (Cons 21 (Cons 11 (Cons 28 ())))) ;; Min value in the list (3 7 2)

```

**Output**:

```mett
  []
  [11]
```

### 4. **RemoveElement**

```mett
! (RemoveElement B (Cons A (Cons B (Cons C ())))) ;; Remove B from the list

```

**Output**:

```mett
[(Cons A (Cons C ()))]
```

---
