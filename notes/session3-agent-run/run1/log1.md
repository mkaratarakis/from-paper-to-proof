# Task 1

Statement: `∀ m n : ℕ, Odd m → Odd n → Odd (m * n)`

## Plan

The product of two odd natural numbers is odd: if m = 2a + 1 and n = 2b + 1 then
m * n = 2(2ab + a + b) + 1. This is a standard fact, so by rule 3 I first look for it in
Mathlib; I expect it to be there under the name `Odd.mul` (stated for any semiring). The proof
is then: unfold `Statement`, introduce m, n and the two hypotheses, and apply that lemma.
If the name is wrong I will fall back on the witnesses a, b above and `ring`.

Mathlib search before attempt 1: grepping the Mathlib sources for `Odd.mul` found
`Mathlib/Algebra/Ring/Parity.lean:140: @[simp] lemma Odd.mul : Odd a → Odd b → Odd (a * b)`.
So the lemma exists and I use it.

## Attempt 1

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro m n hm hn
  exact Odd.mul hm hn
```

```
(no output)
```

Lean accepts it. `intro` saw through the definition `Statement` without my unfolding it.

## Axioms

File below the dashes at this run:

```lean
-- Your work goes below this line.

theorem main : Statement := by
  intro m n hm hn
  exact Odd.mul hm hn

#print axioms main
```

```
'main' depends on axioms: [propext]
```

## Result

Proved in 1 attempt (plus the axiom run), using Mathlib's `Odd.mul`. Only the standard axiom
`propext` is used.
