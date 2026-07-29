import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure MarkovChainStateSpace where
  StateType : Type u
  Countable : Countable StateType
  MeasurableState : MeasurableSpace StateType

structure MarkovChainTransitionKernel (S : MarkovChainStateSpace) where
  kernel : S.StateType → Set (S.StateType) → ℝ
  nonnegative : ∀ x A, kernel x A ≥ 0
  sumToOne : ∀ x, kernel x Set.univ = 1
  measurable : ∀ A, MeasurableSet A → Measurable (λ x => kernel x A)

structure MarkovChainInitialDistribution (S : MarkovChainStateSpace) where
  dist : Set (S.StateType) → ℝ
  nonnegative : ∀ A, dist A ≥ 0
  totalMass : dist Set.univ = 1
  measurable : ∀ A, MeasurableSet A → Measurable dist

def MarkovChainStateSpaceClosed (S : MarkovChainStateSpace) : Prop :=
  S.Countable ∧ S.MeasurableState = MeasurableSpace.compl? 

theorem markov_chain_state_space_closed (S : MarkovChainStateSpace) : MarkovChainStateSpaceClosed S := by
  exact And.intro S.Countable (by rfl)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse