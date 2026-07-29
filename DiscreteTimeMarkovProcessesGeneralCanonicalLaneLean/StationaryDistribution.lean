import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.HardyWeinbergEquilibrium
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure StationaryDistributionPackage {P : DTMProcessPackage} where
  distribution : P.stateSpace -> ℝ
  invarianceEquation : Prop
  uniqueness : Prop
  existence : Prop

structure StationaryDistributionEvidence {P : DTMProcessPackage} (S : StationaryDistributionPackage P) where
  invarianceEquationClosed : S.invarianceEquation
  uniquenessClosed : S.uniqueness
  existenceClosed : S.existence

def StationaryDistributionClosed {P : DTMProcessPackage} (S : StationaryDistributionPackage P) : Prop :=
  S.invarianceEquation ∧ S.uniqueness ∧ S.existence

theorem stationary_distribution_closed_from_evidence {P : DTMProcessPackage} (S : StationaryDistributionPackage P) (E : StationaryDistributionEvidence S) :
    StationaryDistributionClosed S :=
  And.intro E.invarianceEquationClosed (And.intro E.uniquenessClosed E.existenceClosed)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse