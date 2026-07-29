import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.BridgeLemmas
import FermatLittleTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

def ConstrainedFermatLittleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fermat_little_endgame (A : AdmissibleClass) :
    ConstrainedFermatLittleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse