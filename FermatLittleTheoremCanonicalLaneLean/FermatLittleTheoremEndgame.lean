import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

def ConstrainedFermatClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fermat_endgame (A : AdmissibleClass) :
    ConstrainedFermatClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse