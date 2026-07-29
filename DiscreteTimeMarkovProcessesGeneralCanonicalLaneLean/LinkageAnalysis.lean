import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure LinkageAnalysis where
  lociPair : Type
  recombinationFraction : ℝ
  lodScore : ℝ

structure LinkageAnalysisEvidence (L : LinkageAnalysis) where
  recombinationFractionClosed : L.recombinationFraction ≥ 0
  lodScoreClosed : L.lodScore > 3

structure LinkageAnalysisClosed (L : LinkageAnalysis) : Prop :=
  L.recombinationFraction ≥ 0 ∧ L.lodScore > 3

theorem linkage_analysis_closed_from_evidence (L : LinkageAnalysis)
    (E : LinkageAnalysisEvidence L) : LinkageAnalysisClosed L :=
  And.intro E.recombinationFractionClosed E.lodScoreClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse