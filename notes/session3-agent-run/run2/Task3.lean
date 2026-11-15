import Mathlib

-- The statement. Do not edit anything above the line of dashes.
def Statement : Prop :=
  Irrational (Real.sqrt 2 + Real.sqrt 3)

--------------------------------------------------------------------------------
-- Your work goes below this line.

theorem main : Statement := by
  have h6 : Irrational (Real.sqrt 6) := by norm_num
  have hsq : (Real.sqrt 2 + Real.sqrt 3) ^ 2 = ((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6 := by
    have h2 : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    have h3 : Real.sqrt 3 ^ 2 = 3 := Real.sq_sqrt (by norm_num)
    have h6' : Real.sqrt 6 = Real.sqrt 2 * Real.sqrt 3 := by
      rw [← Real.sqrt_mul (by norm_num)]
      norm_num
    rw [h6']
    push_cast
    linear_combination h2 + h3
  have h5 : Irrational (((5 : ℚ) : ℝ) + ((2 : ℚ) : ℝ) * Real.sqrt 6) :=
    (h6.ratCast_mul (q := 2) (by norm_num)).ratCast_add 5
  rw [← hsq] at h5
  exact h5.of_pow 2

#print axioms main
