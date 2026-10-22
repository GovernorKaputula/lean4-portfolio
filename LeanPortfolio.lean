/-! Constructive propositional logic: explicit proof terms and tactics. -/
namespace LeanPortfolio.Logic

theorem and_commute (P Q : Prop) : P ∧ Q → Q ∧ P := by
  intro h
  exact ⟨h.2, h.1⟩

theorem compose (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) : P → R := by
  intro hp
  exact hqr (hpq hp)

theorem distribute (P Q R : Prop) : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  intro h
  cases h.2 with
  | inl hq => exact Or.inl ⟨h.1, hq⟩
  | inr hr => exact Or.inr ⟨h.1, hr⟩

end LeanPortfolio.Logic
/-! Induction over natural numbers, without external dependencies. -/
namespace LeanPortfolio.Arithmetic

def triangular : Nat → Nat
  | 0 => 0
  | n + 1 => triangular n + (n + 1)

theorem triangular_step (n : Nat) :
    triangular (n + 1) = triangular n + (n + 1) := by
  rfl

theorem add_zero_right (n : Nat) : n + 0 = n := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg Nat.succ ih

example : triangular 5 = 15 := by rfl

end LeanPortfolio.Arithmetic
/-! A recursive list program with a proof that it preserves length. -/
namespace LeanPortfolio.VerifiedPrograms

def mapList (f : α → β) : List α → List β
  | [] => []
  | x :: xs => f x :: mapList f xs

theorem mapList_length (f : α → β) (xs : List α) :
    (mapList f xs).length = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => exact congrArg Nat.succ ih

theorem mapList_identity (xs : List α) : mapList id xs = xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => exact congrArg (List.cons x) ih

example : mapList (fun n : Nat => n + 1) [1, 2, 3] = [2, 3, 4] := by rfl

end LeanPortfolio.VerifiedPrograms
