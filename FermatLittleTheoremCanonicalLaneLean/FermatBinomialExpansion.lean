import canonicalLaneMathlib.AdmissibleClass
import FermatLittleTheoremCanonicalLaneLean.FermatGroupAction

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure BinomialExpansionPackage where
  prime : ℕ
  primeFact : Fact (Nat.Prime prime)
  binomialTheoremModPrime : ∀ (a b : ℤ), (a + b) ^ prime ≡ a ^ prime + b ^ prime [ZMOD prime]
  binomialTheoremProof : binomialTheoremModPrime

theorem binomial_expansion_mod_prime (B : BinomialExpansionPackage) : B.binomialTheoremModPrime := B.binomialTheoremProof

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse