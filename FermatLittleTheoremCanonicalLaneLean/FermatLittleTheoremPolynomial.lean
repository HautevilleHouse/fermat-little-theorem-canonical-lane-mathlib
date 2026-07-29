import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure PolynomialOverFiniteField (p : ℕ) where
  field : FieldOfPrimeOrder p
  polynomialRing : Type
  variable : polynomialRing
  polynomialAxioms : CommRing polynomialRing
  frobeniusEndomorphism : polynomialRing → polynomialRing
  frobeniusProperty : ∀ f : polynomialRing, frobeniusEndomorphism f = f ^ (Fintype.card (field.carrier))

def FrobeniusAutomorphism (p : ℕ) (hp : Nat.Prime p) (F : PolynomialOverFiniteField hp) :
    F.polynomialRing → F.polynomialRing :=
  F.frobeniusEndomorphism

theorem fermat_little_theorem_polynomial (p : ℕ) (hp : Nat.Prime p) (F : PolynomialOverFiniteField hp) (f : F.polynomialRing) :
    F.frobeniusEndomorphism (F.frobeniusEndomorphism f) = F.frobeniusEndomorphism f := by
  have hcard : Fintype.card (F.field.carrier) = p := FieldOfPrimeOrder.card_eq_prime hp
  have hFermat : ∀ x : F.polynomialRing, x ^ (Fintype.card (F.field.carrier)) = x := by
    intro x
    -- Since the polynomial ring is a finite field of order p (by the structure's properties),
    -- we can use the standard lemma for finite fields.
    -- However, we don't have direct access to that lemma; we use the frobeniusProperty for x.
    -- Note: frobeniusProperty gives frobeniusEndomorphism x = x^q, but we need x^q = x.
    -- This holds because frobeniusEndomorphism is the identity (since the field is prime).
    -- We can use the fact that the field is of prime order and the polynomial ring is an algebra over it.
    -- But for now, we use a known theorem: in a field of order p, every element satisfies a^p = a.
    -- This should be available via the structure FieldOfPrimeOrder.
    -- We'll use FieldOfPrimeOrder.pow_card_eq_self.
    have h := FieldOfPrimeOrder.pow_card_eq_self hp (F.field)
    exact h x
  calc
    F.frobeniusEndomorphism (F.frobeniusEndomorphism f) = (F.frobeniusEndomorphism f) ^ (Fintype.card (F.field.carrier)) := by
      rw [F.frobeniusProperty (F.frobeniusEndomorphism f)]
    _ = F.frobeniusEndomorphism f := by rw [hFermat (F.frobeniusEndomorphism f)]

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse