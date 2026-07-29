import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure DTMProcessPackage where
  stateSpace : Type u
  transitionKernel : stateSpace -> stateSpace -> ℝ
  initialDistribution : stateSpace -> ℝ
  timeHomogeneous : Prop
  markovProperty : Prop

structure DTMProcessEvidence (P : DTMProcessPackage) where
  timeHomogeneousClosed : P.timeHomogeneous
  markovPropertyClosed : P.markovProperty

def DTMProcessClosed (P : DTMProcessPackage) : Prop :=
  P.timeHomogeneous ∧ P.markovProperty

theorem dtm_process_closed_from_evidence (P : DTMProcessPackage) (E : DTMProcessEvidence P) :
    DTMProcessClosed P :=
  And.intro E.timeHomogeneousClosed E.markovPropertyClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse