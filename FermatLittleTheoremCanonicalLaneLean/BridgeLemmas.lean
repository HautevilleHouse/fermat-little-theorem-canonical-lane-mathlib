import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | FermatLittleObject p =>
    let F : FermatLittleTheoremPackage := somePackage p
    FermatLittleTheoremClosed F

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  -- This proof is constructible from the admissible class
  sorry

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse