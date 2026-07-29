import CohomologyGroupsLemmaCanonicalLaneLean.CohomologyBridgeLemmas

namespace HautevilleHouse
namespace CohomologyGroupsLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.remainderRecorded

end CohomologyGroupsLemmaCanonicalLaneLean
end HautevilleHouse