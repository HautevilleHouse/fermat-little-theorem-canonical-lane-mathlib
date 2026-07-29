import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FermatAnalyticEvidenceTerms (A : AdmissibleClass) where
  bridgeClosedTerm : bridgeClosed A
  gateClosedTerm : gateClosed A

def FermatAnalyticEvidenceTerms.fromAdmissibleClass (A : AdmissibleClass) : FermatAnalyticEvidenceTerms A :=
  {
    bridgeClosedTerm := bridge_from_admissible_class A
    gateClosedTerm := gate_from_admissible_class A
  }

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse