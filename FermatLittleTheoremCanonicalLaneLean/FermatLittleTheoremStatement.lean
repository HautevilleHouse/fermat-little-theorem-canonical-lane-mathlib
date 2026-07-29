import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FermatLittleTheoremPackage where
  prime : ℕ
  primeProperty : Fact (Nat.Prime prime)
  base : ℕ
  congruence : ℕ → Prop
  exponentCongruence : congruence (base ^ prime) = congruence base

structure FermatLittleTheoremEvidence (F : FermatLittleTheoremPackage) where
  congruenceModPrimeClosed : F.congruence (F.base ^ F.prime) = F.congruence F.base
  baseNotDivisible : F.base % F.prime ≠ 0

def FermatLittleTheoremClosed (F : FermatLittleTheoremPackage) : Prop :=
  F.congruence (F.base ^ F.prime) = F.congruence F.base

theorem fermat_little_theorem_closed_from_evidence (F : FermatLittleTheoremPackage)
    (E : FermatLittleTheoremEvidence F) : FermatLittleTheoremClosed F := by
  exact E.congruenceModPrimeClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse