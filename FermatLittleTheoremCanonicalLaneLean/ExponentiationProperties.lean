import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure ExponentiationStructure where
  base : ℕ
  exponent : ℕ
  power : ℕ
  exponentiationLaw : Prop
  exponentiationLawTerm : exponentiationLaw

structure ExponentiationEvidence (E : ExponentiationStructure) where
  exponentiationLawClosed : E.exponentiationLaw

def ExponentiationClosed (E : ExponentiationStructure) : Prop :=
  E.exponentiationLaw

theorem exponentiation_closed_from_evidence (E : ExponentiationStructure) (Ev : ExponentiationEvidence E) :
    ExponentiationClosed E := by
  exact Ev.exponentiationLawClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse