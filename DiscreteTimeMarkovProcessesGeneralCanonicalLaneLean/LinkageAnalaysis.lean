import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure LinkageAnalysis where
  markerDistance : ℝ
  recombinationRate : ℝ
  lodScore : ℝ
  linkagePresent : Prop
  linkagePresentTerm : linkagePresent

structure LinkageEvidence (L : LinkageAnalysis) where
  linkagePresentClosed : L.linkagePresent

def LinkageClosed (L : LinkageAnalysis) : Prop :=
  L.linkagePresent

theorem linkage_closed_from_evidence (L : LinkageAnalysis) (E : LinkageEvidence L) : LinkageClosed L := by
  exact E.linkagePresentClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse