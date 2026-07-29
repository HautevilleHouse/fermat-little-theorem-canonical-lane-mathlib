import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FiniteCyclicGroup (p : ℕ) where
  carrier : Type
  mult : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier
  groupAxioms : Group carrier mult one inv
  primeOrder : Nat.Prime p
  orderEqual : Fintype.card carrier = p
  cyclic : IsCyclic carrier
  abelian : AbelianGroup carrier mult one inv

def FermatLittleTheoremGroup (p : ℕ) : Type :=
  if h : Nat.Prime p then
    (FiniteCyclicGroup h).carrier
  else
    Unit

theorem fermat_little_theorem_group_multiplicative_order (p : ℕ) (hp : Nat.Prime p) (a : FiniteCyclicGroup hp) (ha : a ≠ (FiniteCyclicGroup.one hp)) :
    (FiniteCyclicGroup.mult hp) a ^ (p - 1) = (FiniteCyclicGroup.one hp) := by
  sorry

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse