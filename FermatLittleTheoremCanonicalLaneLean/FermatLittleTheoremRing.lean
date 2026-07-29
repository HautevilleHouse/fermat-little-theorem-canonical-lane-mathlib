import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure FieldOfPrimeOrder (p : ℕ) where
  carrier : Type
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  neg : carrier → carrier
  inv : carrier → carrier
  fieldAxioms : Field carrier zero one add mul neg inv
  primeCharacteristic : CharP carrier p
  finite : Fintype carrier
  order : Fintype.card carrier = p

def FermatLittleTheoremField (p : ℕ) : Type :=
  if h : Nat.Prime p then
    (FieldOfPrimeOrder h).carrier
  else
    Unit

theorem fermat_little_theorem_ring (p : ℕ) (hp : Nat.Prime p) (a : FieldOfPrimeOrder hp) :
    (FieldOfPrimeOrder.mul hp) a ^ (Fintype.card (FieldOfPrimeOrder.carrier hp)) = a := by
  let F := FieldOfPrimeOrder.carrier hp
  have hcard : Fintype.card F = p := (FieldOfPrimeOrder.order hp).symm
  have hprime : p.Prime := hp
  have hF : Field F := (FieldOfPrimeOrder.fieldAxioms hp)
  have hchar : CharP F p := (FieldOfPrimeOrder.primeCharacteristic hp)
  have hfinite : Fintype F := (FieldOfPrimeOrder.finite hp)
  have hzero : (0 : F) := (FieldOfPrimeOrder.zero hp)
  have hone : (1 : F) := (FieldOfPrimeOrder.one hp)
  have hmul : (· * · : F → F → F) := (FieldOfPrimeOrder.mul hp)
  let a' : F := a
  have := FermatLittleTheorem.finiteField (F := F) (p := p) (hF := hF) (hchar := hchar) (hfinite := hfinite) (hcard := hcard)
  have h' : a' ^ (Fintype.card F) = a' := this a'
  simpa using h'

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse