import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.FermatBinomialExpansion

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FermatLittleTheoremPackage (B : BinomialExpansionPackage) where
  statement : ∀ (a : ℤ), a ^ B.prime ≡ a [ZMOD B.prime]
  proof : statement

theorem fermat_little_theorem (B : BinomialExpansionPackage) (F : FermatLittleTheoremPackage B) : F.statement := F.proof

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse