import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

theorem binomial_expansion_mod_p (p : ℕ) (hp : Nat.Prime p) (a b : ℤ) :
    (a + b) ^ p ≡ a ^ p + b ^ p [ZMOD p] := by
  have h : (a + b) ^ p = ∑ k in Finset.range (p + 1), (Nat.choose p k : ℤ) * a ^ (p - k) * b ^ k := by
    exact add_pow a b p
  rw [h]
  calc
    ∑ k in Finset.range (p + 1), (Nat.choose p k : ℤ) * a ^ (p - k) * b ^ k
        ≡ ((Nat.choose p 0 : ℤ) * a ^ (p - 0) * b ^ 0 + (Nat.choose p p : ℤ) * a ^ (p - p) * b ^ p) [ZMOD p] := by
      refine (Finset.sum_mod_add_mod _).trans ?_
      refine Finset.sum_congr rfl fun x hx => ?_
      have hx' : x ∈ Finset.range (p+1) := hx
      simp
    _ = (1 * a ^ p * 1 + 1 * a ^ 0 * b ^ p) := by
      simp [hp, Nat.choose_self, Nat.choose_zero_right, Nat.sub_self]
    _ = a ^ p + b ^ p := by simp

theorem fermat_little_theorem_binomial (p : ℕ) (hp : Nat.Prime p) (a : ℤ) :
    a ^ p ≡ a [ZMOD p] := by
  have h : (a + 1) ^ p ≡ a ^ p + 1 [ZMOD p] := binomial_expansion_mod_p p hp a 1
  have h1 : (a + 1) ^ p ≡ a + 1 [ZMOD p] := by
    have : (a + 1 : ℤ) ^ p ≡ (a + 1) ^ 1 [ZMOD p] := by
      apply pow_mod_cancel (a+1) hp (by omega)
      exact Nat.sub_add_cancel (Nat.Prime.one_lt hp)
    simpa using this
  have h2 : a ^ p + 1 ≡ a + 1 [ZMOD p] := by
    calc
      a ^ p + 1 ≡ (a + 1) ^ p [ZMOD p] := by symm; exact h
      _ ≡ a + 1 [ZMOD p] := h1
      _ = a + 1 := rfl
    
  have : a ^ p - a ≡ 0 [ZMOD p] := by
    calc
      a ^ p - a = (a ^ p + 1) - (a + 1) := by ring
      _ ≡ (a + 1) - (a + 1) [ZMOD p] := by
        apply sub_mod_eq_sub_mod; 
        · exact h2
        · rfl
      _ = 0 := by ring
      _ ≡ 0 [ZMOD p] := by norm_num
    
  -- from a^p - a ≡ 0 mod p we get a^p ≡ a mod p
  calc
    a ^ p = a ^ p - a + a := by ring
    _ ≡ 0 + a [ZMOD p] := by
      apply add_mod_eq_add_mod (a^p - a) 0 a a ?_ (by rfl)
      exact this
    _ = a := by simp
    _ ≡ a [ZMOD p] := by rfl

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse