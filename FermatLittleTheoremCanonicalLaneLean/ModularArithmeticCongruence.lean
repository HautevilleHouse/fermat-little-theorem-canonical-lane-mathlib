import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure ModularArithmeticStructure where
  modulus : ℕ
  residueClass : ℕ → Set ℕ
  additionCompatible : ∀ a b, residueClass (a + b) = (residueClass a).add (residueClass b)
  multiplicationCompatible : ∀ a b, residueClass (a * b) = (residueClass a).mul (residueClass b)
  groupClosedUnderMultiplication : ∀ a, residueClass a ≠ ∅ → residueClass (a ^ (modulus - 1)) = residueClass 1

structure CongruenceEvidence (M : ModularArithmeticStructure) where
  additionCompatibleClosed : ∀ a b, M.residueClass (a + b) = (M.residueClass a).add (M.residueClass b)
  multiplicationCompatibleClosed : ∀ a b, M.residueClass (a * b) = (M.residueClass a).mul (M.residueClass b)
  groupClosedUnderMultiplicationClosed : ∀ a, M.residueClass a ≠ ∅ → M.residueClass (a ^ (M.modulus - 1)) = M.residueClass 1

def ModularArithmeticClosed (M : ModularArithmeticStructure) : Prop :=
  (∀ a b, M.residueClass (a + b) = (M.residueClass a).add (M.residueClass b)) ∧
  (∀ a b, M.residueClass (a * b) = (M.residueClass a).mul (M.residueClass b)) ∧
  (∀ a, M.residueClass a ≠ ∅ → M.residueClass (a ^ (M.modulus - 1)) = M.residueClass 1)

theorem modular_arithmetic_closed_from_evidence (M : ModularArithmeticStructure)
    (E : CongruenceEvidence M) : ModularArithmeticClosed M := by
  exact And.intro E.additionCompatibleClosed
    (And.intro E.multiplicationCompatibleClosed E.groupClosedUnderMultiplicationClosed)

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse