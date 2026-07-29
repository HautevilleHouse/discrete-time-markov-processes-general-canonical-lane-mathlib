import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.DiscreteTimeMarkovPackage

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | PoincareAdmittedObject.mk _ _ _ _ _ h => h
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  cases A.object
  · exact h
  · trivial

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse
