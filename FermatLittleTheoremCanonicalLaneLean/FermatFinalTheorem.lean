import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

-- Final theorem closure
def FermatClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem fermat_endgame (A : AdmissibleClass) : FermatClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse