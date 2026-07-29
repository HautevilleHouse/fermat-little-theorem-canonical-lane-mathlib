import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FermatLittleTheoremCanonicalLaneLean

structure GroupStructure (G : Type) where
  carrier : Set G
  mul : G → G → G
  one : G
  inv : G → G
  mulAssoc : ∀ a b c, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a, mul one a = a
  mulOne : ∀ a, mul a one = a
  mulInv : ∀ a, mul a (inv a) = one
  invMul : ∀ a, mul (inv a) a = one
  finite : Finset G
  carrier_eq_finite : carrier = finite

structure LagrangeTheorem (G : Type) (grp : GroupStructure G) where
  subgroupOrderDivisor : ∀ (H : Set G) (hsub : H ⊆ grp.carrier) (hgrp : GroupStructure H),
    (Finset.card (hgrp.finite)) ∣ Finset.card (grp.finite)
  cosetPartition : ∀ (H : Set G), (Finset.card (grp.finite)) = (Finset.card (H.finite)) * (Finset.card (quotient H).finite)
  quotientDefined : ∀ (H : Set G), Setoid G

def LagrangeClosed (G : Type) (grp : GroupStructure G) (L : LagrangeTheorem G grp) : Prop :=
  ∀ (H : Set G) (hsub : H ⊆ grp.carrier) (hgrp : GroupStructure H),
    (Finset.card (hgrp.finite)) ∣ Finset.card (grp.finite)

theorem lagrange_implies_fermat_multiplicative_subgroup {p : ℕ} (hp : Nat.Prime p)
    (G : Type) [Fintype G] (grp : GroupStructure G) (L : LagrangeTheorem G grp)
    (hcard : Finset.card (grp.finite) = p - 1)
    (h : LagrangeClosed G grp L) :
  ∀ a : G, a ≠ grp.one → a ^ (Finset.card (grp.finite)) = grp.one := by
  intro a ha
  let H : Set G := {a^n | n : ℕ}
  sorry

end FermatLittleTheoremCanonicalLaneLean
end HautevilleHouse