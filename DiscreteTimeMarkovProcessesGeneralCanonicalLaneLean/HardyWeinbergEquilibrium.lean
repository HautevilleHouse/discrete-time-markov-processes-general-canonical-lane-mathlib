import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure HardyWeinbergPackage where
  initialAlleleFrequencies : ℝ × ℝ
  transitionProbabilities : ℝ × ℝ
  equilibriumState : ℝ × ℝ
  convergesToEquilibrium : Prop
  equilibriumReached : Prop

def HardyWeinbergClosed (H : HardyWeinbergPackage) : Prop :=
  H.convergesToEquilibrium ∧ H.equilibriumReached

theorem hardy_weinberg_equilibrium (H : HardyWeinbergPackage) (hconv : H.convergesToEquilibrium) (heq : H.equilibriumReached) :
  HardyWeinbergClosed H := by
  exact And.intro hconv heq

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse
