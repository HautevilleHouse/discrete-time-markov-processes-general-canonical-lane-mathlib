import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure PhylogeneticTree where
  taxa : List String
  treeStructure : Type u
  branchLengths : taxa → ℝ
  substitutionModel : Type v
  likelihood : ℝ
  maximumLikelihoodTree : Prop
  maximumLikelihoodTreeTerm : maximumLikelihoodTree

structure PhylogeneticEvidence (P : PhylogeneticTree) where
  maximumLikelihoodTreeClosed : P.maximumLikelihoodTree

def PhylogeneticClosed (P : PhylogeneticTree) : Prop :=
  P.maximumLikelihoodTree

theorem phylogenetic_closed_from_evidence (P : PhylogeneticTree) (E : PhylogeneticEvidence P) : PhylogeneticClosed P := by
  exact E.maximumLikelihoodTreeClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse