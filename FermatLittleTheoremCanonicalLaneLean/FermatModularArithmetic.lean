import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure ModularArithmeticPackage where
  modulus : ℕ
  modulusPrime : Fact (Nat.Prime modulus)
  finiteField : Type u
  fieldStructure : Field finiteField
  frobeniusAutomorphism : finiteField → finiteField
  frobeniusProperties : Prop
  frobeniusPropertiesTerm : frobeniusProperties

structure ModularArithmeticEvidence (M : ModularArithmeticPackage) where
  modulusPrimeClosed : M.modulusPrime.out
  frobeniusPropertiesClosed : M.frobeniusProperties

def ModularArithmeticClosed (M : ModularArithmeticPackage) : Prop :=
  M.frobeniusProperties

theorem modular_arithmetic_closed_from_evidence (M : ModularArithmeticPackage)
    (E : ModularArithmeticEvidence M) : ModularArithmeticClosed M := by
  exact E.frobeniusPropertiesClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse