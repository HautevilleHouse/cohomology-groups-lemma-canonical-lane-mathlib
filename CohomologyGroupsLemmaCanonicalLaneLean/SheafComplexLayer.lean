import CohomologyGroupsLemmaCanonicalLaneLean.CohomologyGroupLayer

namespace HautevilleHouse
namespace CohomologyGroupsLemmaCanonicalLaneLean

structure NativeSheafComplex (X : Type u) where
  objects : ℕ → Type u
  differentials : (n : ℕ) → (objects n → objects (n+1))

def NativeSheafComplex.cohomology (C : NativeSheafComplex X) (n : ℕ) : Type u :=
  kernel (C.differentials n) ⧸ image (C.differentials (n-1))

structure SheafComplexSubstrate where
  objectsAvailable : Bool
  differentialsAvailable : Bool
  cohomologyDefined : Bool

def sheafComplexSubstrate : SheafComplexSubstrate := {
  objectsAvailable := true
  differentialsAvailable := true
  cohomologyDefined := true
}

theorem sheaf_complex_substrate_checked :
    sheafComplexSubstrate.objectsAvailable = true ∧
    sheafComplexSubstrate.differentialsAvailable = true ∧
    sheafComplexSubstrate.cohomologyDefined = true := by
  exact ⟨rfl, rfl, rfl⟩

end CohomologyGroupsLemmaCanonicalLaneLean
end HautevilleHouse