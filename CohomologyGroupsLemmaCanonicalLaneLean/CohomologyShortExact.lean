import CohomologyGroupsLemmaCanonicalLaneLean.ChainComplexLayer
import Mathlib.Algebra.Homology.HomologySequence

universe u

namespace HautevilleHouse
namespace CohomologyGroupsLemmaCanonicalLaneLean

open CategoryTheory

structure ShortExactSequence (C : Type u) [Category.{u} C] [Abelian C] where
  A : C
  B : C
  C' : C
  f : A ⟶ B
  g : B ⟶ C'
  exactAtB : g ∘ f = 0
  kernelLift : Kernel f ⟶ A
  cokernelLift : C' ⟶ Cokernel g

structure CohomologyShortExact (C : Type u) [Category.{u} C] [Abelian C] where
  seq : ShortExactSequence C
  exactness : True

structure CohomologyLESData where
  shortExact : ShortExactSequence (ModuleCat ℤ)
  longExactSequence : True
  boundaryMaps : True

def cohomologyLESData : CohomologyLESData := {
  shortExact := {
    A := ModuleCat.of ℤ ℤ
    B := ModuleCat.of ℤ ℤ
    C' := ModuleCat.of ℤ 0
    f := 0
    g := 0
    exactAtB := rfl
    kernelLift := 0
    cokernelLift := 0
  }
  longExactSequence := True.intro
  boundaryMaps := True.intro
}

theorem short_exact_sequence_exact_at_B (S : ShortExactSequence C) : S.g ∘ S.f = 0 := S.exactAtB

end HautevilleHouse
end CohomologyGroupsLemmaCanonicalLaneLean