import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure GroupStructure where
  carrier : Type
  identity : carrier
  multiplication : carrier → carrier → carrier
  inverse : carrier → carrier
  groupAxioms : Prop
  groupAxiomsTerm : groupAxioms

structure GroupEvidence (G : GroupStructure) where
  groupAxiomsClosed : G.groupAxioms

def GroupClosed (G : GroupStructure) : Prop :=
  G.groupAxioms

theorem group_closed_from_evidence (G : GroupStructure) (E : GroupEvidence G) :
    GroupClosed G := by
  exact E.groupAxiomsClosed

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse