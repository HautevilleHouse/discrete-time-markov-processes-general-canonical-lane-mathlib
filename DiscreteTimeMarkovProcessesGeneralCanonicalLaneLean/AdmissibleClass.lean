import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure MarkovSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)

structure MarkovAdmittedObject where
  stateSpace : MarkovSpace
  transitionKernel : stateSpace.carrier -> stateSpace.carrier -> ℝ
  stationaryDistribution : stateSpace.carrier -> ℝ
  irreducible : Prop
  aperiodic : Prop
  convergenceInTotalVariation : Prop

structure MarkovEndgameState where
  object : MarkovAdmittedObject

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.convergenceInTotalVariation

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse