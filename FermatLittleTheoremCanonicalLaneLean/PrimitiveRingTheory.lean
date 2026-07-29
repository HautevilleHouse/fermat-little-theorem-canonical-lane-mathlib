import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure PrimitiveRingZMod (p : ℕ) where
  carrier : Set ℕ
  zero : ℕ
  one : ℕ
  add : ℕ → ℕ → ℕ
  mul : ℕ → ℕ → ℕ
  zeroIsZero : zero = 0
  oneIsOne : one = 1
  additiveGroup : ∀ a b, add a b = (a + b) % p
  multiplicativeMonoid : ∀ a b, mul a b = (a * b) % p
  multiplicativeIdentity : ∀ a, mul a one = a % p
  multiplicativeInverse : ∀ a, a % p ≠ 0 → ∃ b, mul a b = one

def PrimitiveRingClosed {p : ℕ} (R : PrimitiveRingZMod p) : Prop :=
  (∀ a b, R.add a b = (a + b) % p) ∧
  (∀ a b, R.mul a b = (a * b) % p) ∧
  (∀ a, R.mul a R.one = a % p) ∧
  (∀ a, a % p ≠ 0 → ∃ b, R.mul a b = R.one)

theorem primitive_ring_closed {p : ℕ} (R : PrimitiveRingZMod p) : PrimitiveRingClosed R := by
  exact And.intro R.additiveGroup
    (And.intro R.multiplicativeMonoid
      (And.intro R.multiplicativeIdentity R.multiplicativeInverse))

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse