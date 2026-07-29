import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.FermatMultiplicativeGroup

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure GroupActionPackage {M : ModularArithmeticPackage} (G : MultiplicativeGroupPackage M) where
  action : G.groupType → M.finiteField → M.finiteField
  actionDistributive : ∀ (g h : G.groupType) (x : M.finiteField), action (g * h) x = action g (action h x)
  actionUnital : ∀ (x : M.finiteField), action 1 x = x
  actionProperties : Prop
  actionPropertiesTerm : actionProperties

theorem group_action_properties {M : ModularArithmeticPackage} {G : MultiplicativeGroupPackage M}
    (A : GroupActionPackage G) : A.actionProperties := A.actionPropertiesTerm

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse