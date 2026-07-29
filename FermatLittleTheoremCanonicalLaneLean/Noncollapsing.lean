import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure NoncollapsingPackage where
  noLocalCollapsingFound : Prop
  scaleInvariantVolumeLowerBound : Prop

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.noLocalCollapsingFound ∧ N.scaleInvariantVolumeLowerBound

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse