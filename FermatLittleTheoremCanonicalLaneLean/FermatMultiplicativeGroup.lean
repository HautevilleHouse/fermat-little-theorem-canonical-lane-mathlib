import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.FermatModularArithmetic

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure MultiplicativeGroupPackage (M : ModularArithmeticPackage) where
  groupType : Type u
  groupStructure : Group groupType
  orderEqualsModMinusOne : orderOf (1 : groupType) = M.modulus - 1
  orderDefined : orderEqualsModMinusOne

theorem multiplicative_group_order_property (M : ModularArithmeticPackage)
    (G : MultiplicativeGroupPackage M) : G.orderEqualsModMinusOne := G.orderDefined

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse