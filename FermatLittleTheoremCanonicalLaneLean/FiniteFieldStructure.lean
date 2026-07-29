import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FiniteFieldStructure where
  order : ℕ
  characteristic : ℕ
  addition : ℕ → ℕ → ℕ
  multiplication : ℕ → ℕ → ℕ
  fieldAxioms : Prop
  finiteAxiom : Prop
  fieldAxiomsTerm : fieldAxioms
  finiteAxiomTerm : finiteAxiom

structure FiniteFieldEvidence (F : FiniteFieldStructure) where
  fieldAxiomsClosed : F.fieldAxioms
  finiteAxiomClosed : F.finiteAxiom

def FiniteFieldClosed (F : FiniteFieldStructure) : Prop :=
  F.fieldAxioms ∧ F.finiteAxiom

theorem finite_field_closed_from_evidence (F : FiniteFieldStructure) (E : FiniteFieldEvidence F) :
    FiniteFieldClosed F := by
  exact And.intro E.fieldAxiomsClosed E.finiteAxiomClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse