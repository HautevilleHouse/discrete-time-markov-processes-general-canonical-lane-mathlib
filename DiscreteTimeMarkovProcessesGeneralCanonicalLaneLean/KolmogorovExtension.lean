import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.ErgodicityPackage
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure KolmogorovExtensionPackage {P : DTMProcessPackage} where
  finiteDimensionalDistributions : Prop
  consistencyCondition : Prop
  pathSpaceMeasure : Prop
  extensionTheoremApplied : Prop

structure KolmogorovExtensionEvidence {P : DTMProcessPackage} (K : KolmogorovExtensionPackage P) where
  finiteDimensionalDistributionsClosed : K.finiteDimensionalDistributions
  consistencyConditionClosed : K.consistencyCondition
  pathSpaceMeasureClosed : K.pathSpaceMeasure
  extensionTheoremAppliedClosed : K.extensionTheoremApplied

def KolmogorovExtensionClosed {P : DTMProcessPackage} (K : KolmogorovExtensionPackage P) : Prop :=
  K.finiteDimensionalDistributions ∧ K.consistencyCondition ∧ K.pathSpaceMeasure ∧ K.extensionTheoremApplied

theorem kolmogorov_extension_closed_from_evidence {P : DTMProcessPackage} (K : KolmogorovExtensionPackage P) (E : KolmogorovExtensionEvidence K) :
    KolmogorovExtensionClosed K :=
  And.intro E.finiteDimensionalDistributionsClosed (And.intro E.consistencyConditionClosed (And.intro E.pathSpaceMeasureClosed E.extensionTheoremAppliedClosed))

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse