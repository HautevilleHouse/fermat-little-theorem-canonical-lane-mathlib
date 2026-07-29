import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

-- Package for primality witnesses based on FLT
structure FermatWitnessPackage (M : FermatModularArithmetic) where
  witness : Nat
  witnessCondition : Prop
  witnessVerification : witnessCondition

def FermatWitnessPackageClosed {M : FermatModularArithmetic}
    (W : FermatWitnessPackage M) : Prop :=
  W.witnessCondition

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse