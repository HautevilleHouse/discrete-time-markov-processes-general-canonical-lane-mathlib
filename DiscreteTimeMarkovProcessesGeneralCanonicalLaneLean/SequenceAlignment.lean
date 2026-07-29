import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure SequenceAlignmentPackage where
  referenceSequence : List Char
  querySequence : List Char
  substitutionMatrix : Char -> Char -> ℝ
  gapPenalty : ℝ
  optimalScore : ℝ
  alignmentFound : Prop

def SequenceAlignmentClosed (S : SequenceAlignmentPackage) : Prop :=
  S.alignmentFound

theorem sequence_alignment_exists (S : SequenceAlignmentPackage) (h : S.alignmentFound) :
  SequenceAlignmentClosed S := by
  exact h

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse
