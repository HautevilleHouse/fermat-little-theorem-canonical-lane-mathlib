import canonicalLaneMathlib.AdmissibleClass
import Mathlib.NumberTheory.FermatLittle

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FermatAdmittedObject where
  modulus : ℕ
  modulusPrime : Nat.Prime modulus
  base : ℕ
  baseCoprime : Nat.Coprime base modulus
  conclusion : base ^ (modulus - 1) % modulus = 1 % modulus

structure FermatEndgameState where
  object : FermatAdmittedObject

def FermatWitnessClosed (O : FermatAdmittedObject) : Prop :=
  O.conclusion

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse