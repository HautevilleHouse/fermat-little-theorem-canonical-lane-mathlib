import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure ModularArithmeticStructure where
  modulus : ℕ
  residueClass : ℕ → Prop
  multiplication : ℕ → ℕ → ℕ
  addition : ℕ → ℕ → ℕ
  modProperties : Prop
  closureUnderOps : Prop
  modPropertiesTerm : modProperties
  closureUnderOpsTerm : closureUnderOps

structure ModularArithmeticEvidence (M : ModularArithmeticStructure) where
  modPropertiesClosed : M.modProperties
  closureUnderOpsClosed : M.closureUnderOps

def ModularArithmeticClosed (M : ModularArithmeticStructure) : Prop :=
  M.modProperties ∧ M.closureUnderOps

theorem modular_arithmetic_closed_from_evidence (M : ModularArithmeticStructure) (E : ModularArithmeticEvidence M) :
    ModularArithmeticClosed M := by
  exact And.intro E.modPropertiesClosed E.closureUnderOpsClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse