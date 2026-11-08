import Mathlib

/-!
# Test file

If Lean and Mathlib are set up correctly:
- click on the line `#eval 2 + 2`: the panel on the right shows `4`;
- nothing in this file is underlined in red.

The first time, `import Mathlib` can take a minute or two to load.
-/

#eval 2 + 2

#check Real.pi

example (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  nlinarith [sq_nonneg (a - b)]
