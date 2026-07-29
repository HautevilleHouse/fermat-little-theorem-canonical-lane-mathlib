import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

-- Polynomial extension of FLT
structure FermatPolyadicExtension (M : FermatModularArithmetic) where
  polynomial : Polynomial ℕ
  evaluationCondition : Prop
  extensionProof : evaluationCondition

def FermatPolyadicExtensionClosed {M : FermatModularArithmetic}
    (E : FermatPolyadicExtension M) : Prop :=
  E.evaluationCondition

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse