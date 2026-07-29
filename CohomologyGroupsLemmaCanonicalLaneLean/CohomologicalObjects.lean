import CohomologyGroupsLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.AlgebraicTopology.SimplicialSet
import Mathlib.AlgebraicTopology.DoldKan
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Algebra.Homology.Homology

universe u

namespace HautevilleHouse
namespace CohomologyGroupsLemmaCanonicalLaneLean

open CategoryTheory
open HomologicalComplex

abbrev NativeChainComplex (C : Type u) [Category.{u} C] [Abelian C] : Type (u+1) :=
  ChainComplex C ℕ

abbrev NativeCochainComplex (C : Type u) [Category.{u} C] [Abelian C] : Type (u+1) :=
  CochainComplex C ℕ

abbrev NativeHomology (C : Type u) [Category.{u} C] [Abelian C] (X : ChainComplex C ℕ) (n : ℕ) : C :=
  X.homology n

abbrev NativeCohomology (C : Type u) [Category.{u} C] [Abelian C] (X : CochainComplex C ℕ) (n : ℕ) : C :=
  X.cohomology n

structure NativeCohomologyGroup (X : Type u) [TopologicalSpace X] (G : Type u) [AddCommGroup G] (n : ℕ) where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier

structure CohomologyObject where
  space : Type u
  [top : TopologicalSpace space]
  coefficientGroup : Type u
  [addCommGroup : AddCommGroup coefficientGroup]
  degree : ℕ
  group : NativeCohomologyGroup space coefficientGroup degree

def trivialCohomologyObject (X : Type u) [TopologicalSpace X] (G : Type u) [AddCommGroup G] (n : ℕ) : CohomologyObject where
  space := X
  coefficientGroup := G
  degree := n
  group := { carrier := PUnit, add := fun _ _ => PUnit.unit, zero := PUnit.unit, neg := fun _ => PUnit.unit }

theorem cohomology_object_degree_nonnegative (C : CohomologyObject) : 0 ≤ C.degree := by
  omega

end HautevilleHouse
end CohomologyGroupsLemmaCanonicalLaneLean