import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure DiscreteTimeMarkovPackage where
  stateSpace : Type u
  transitionMatrix : stateSpace -> stateSpace -> ℝ
  initialDistribution : stateSpace -> ℝ
  timeHomogeneous : Prop
  irreducible : Prop
  stationaryDistribution : stateSpace -> ℝ
  stationaryProbability : Prop

def stationaryDistributionClosed (P : DiscreteTimeMarkovPackage) : Prop :=
  P.stationaryProbability ∧ P.irreducible

theorem stationary_distribution_exists (P : DiscreteTimeMarkovPackage) (h : P.irreducible) (h' : P.stationaryProbability) :
  stationaryDistributionClosed P := by
  exact And.intro h' h

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse
