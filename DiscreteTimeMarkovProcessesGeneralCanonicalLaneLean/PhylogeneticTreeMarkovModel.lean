import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure PhylogeneticTreeMarkovModel where
  species : Type
  substitutionRates : species -> species -> ℝ
  branchLengths : ℝ
  likelihood : ℝ

structure PhylogeneticTreeMarkovModelEvidence (P : PhylogeneticTreeMarkovModel) where
  substitutionRatesClosed : ∀ a b : species P, P.substitutionRates a b ≥ 0
  branchLengthsClosed : P.branchLengths ≥ 0
  likelihoodClosed : P.likelihood ≤ 1

structure PhylogeneticTreeMarkovModelClosed (P : PhylogeneticTreeMarkovModel) : Prop :=
  (∀ a b : species P, P.substitutionRates a b ≥ 0) ∧
  P.branchLengths ≥ 0 ∧
  P.likelihood ≤ 1

theorem phylogenetic_tree_markov_model_closed_from_evidence (P : PhylogeneticTreeMarkovModel)
    (E : PhylogeneticTreeMarkovModelEvidence P) : PhylogeneticTreeMarkovModelClosed P :=
  And.intro E.substitutionRatesClosed (And.intro E.branchLengthsClosed E.likelihoodClosed)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse