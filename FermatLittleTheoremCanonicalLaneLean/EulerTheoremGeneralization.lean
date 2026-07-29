import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure EulerTheoremPackage where
  n : ℕ
  totients : ℕ → ℕ
  totientDef : totients n = (Finset.filter (λ x => Nat.gcd x n = 1) (Finset.range n)).card
  exponentCongruence : ℕ → ℕ → Prop
  eulerConjecture : ∀ a, Nat.gcd a n = 1 → exponentCongruence a (a ^ totients n)

def EulerTheoremClosed (E : EulerTheoremPackage) : Prop :=
  ∀ a, Nat.gcd a E.n = 1 → E.exponentCongruence a (a ^ E.totients E.n)

theorem euler_theorem_implies_fermat_little {p : ℕ} (hp : Nat.Prime p) (E : EulerTheoremPackage)
    (h : EulerTheoremClosed E) (hpn : E.n = p) :
  ∀ a, a % p ≠ 0 → E.exponentCongruence a (a ^ (p - 1)) := by
  intro a ha
  have hgcd : Nat.gcd a p = 1 := by
    apply Nat.eq_one_of_dvd_one (Nat.gcd_dvd_right a p)
    exact Nat.prime.coprime_iff_not_dvd hp ha
  have htot : E.totients p = p - 1 := by
    simpa [hpn] using (Nat.totient_prime hp)
  have := h a hgcd
  simpa [hpn, htot] using this

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse