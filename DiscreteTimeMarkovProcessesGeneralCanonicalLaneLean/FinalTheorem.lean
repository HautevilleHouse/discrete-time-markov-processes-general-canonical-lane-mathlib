import canonicalLaneMathlib.AdmissibleClass
import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.BridgeLemmas
import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

def DiscreteTimeMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem discrete_time_markov_endgame (A : AdmissibleClass) : DiscreteTimeMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse
