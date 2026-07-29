import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure SequenceAlignmentHMM where
  stateSpace : Type
  emissionAlphabet : Type
  transitionProbabilities : stateSpace -> stateSpace -> ℝ
  emissionProbabilities : stateSpace -> emissionAlphabet -> ℝ
  initialStates : stateSpace -> ℝ
  alignmentScore : ℝ

structure SequenceAlignmentHMMEvidence (H : SequenceAlignmentHMM) where
  transitionProbabilitiesClosed : ∀ s t : stateSpace H, H.transitionProbabilities s t ≥ 0
  emissionProbabilitiesClosed : ∀ s : stateSpace H, ∀ e : emissionAlphabet H, H.emissionProbabilities s e ≥ 0
  alignmentScoreClosed : H.alignmentScore ≥ 0

structure SequenceAlignmentHMMClosed (H : SequenceAlignmentHMM) : Prop :=
  (∀ s t : stateSpace H, H.transitionProbabilities s t ≥ 0) ∧
  (∀ s : stateSpace H, ∀ e : emissionAlphabet H, H.emissionProbabilities s e ≥ 0) ∧
  H.alignmentScore ≥ 0

theorem sequence_alignment_hmm_closed_from_evidence (H : SequenceAlignmentHMM)
    (E : SequenceAlignmentHMMEvidence H) : SequenceAlignmentHMMClosed H :=
  And.intro E.transitionProbabilitiesClosed (And.intro E.emissionProbabilitiesClosed E.alignmentScoreClosed)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse