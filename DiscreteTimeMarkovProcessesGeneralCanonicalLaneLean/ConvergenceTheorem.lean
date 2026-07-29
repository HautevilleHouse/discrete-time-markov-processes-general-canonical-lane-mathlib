import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure ConvergencePackage
    (S : StationaryDistributionPackage) where
  initialDistribution : Vector ℝ (Fin S.stateSpaceSize)
  totalVariationDistance : ℕ → ℝ
  convergenceRate : Prop
  mixingTime : ℕ
  geometricDecay : Prop

structure ConvergenceEvidence
    {S : StationaryDistributionPackage}
    (C : ConvergencePackage S) where
  rateClosed : C.convergenceRate
  decayClosed : C.geometricDecay

def ConvergenceClosed
    {S : StationaryDistributionPackage}
    (C : ConvergencePackage S) : Prop :=
  C.convergenceRate ∧ C.geometricDecay

theorem convergence_closed_from_evidence
    {S : StationaryDistributionPackage}
    (C : ConvergencePackage S) (E : ConvergenceEvidence C) :
    ConvergenceClosed C := by
  exact And.intro E.rateClosed E.decayClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse