import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

-- Core proof structure for Fermat's Little Theorem
structure FermatLittleTheoremProof (M : FermatModularArithmetic) where
  theoremStatement : Prop
  proofGiven : theoremStatement

def FermatLittleTheoremProofClosed {M : FermatModularArithmetic}
    (P : FermatLittleTheoremProof M) : Prop :=
  P.theoremStatement

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse