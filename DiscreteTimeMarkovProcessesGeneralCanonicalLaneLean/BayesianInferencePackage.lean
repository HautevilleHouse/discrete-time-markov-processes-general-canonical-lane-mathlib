import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.KolmogorovExtension
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure BayesianInferencePackage {P : DTMProcessPackage} {K : KolmogorovExtensionPackage P} where
  priorDistribution : P.stateSpace -> ℝ
  likelihoodFunction : P.stateSpace -> P.stateSpace -> ℝ
  posteriorComputed : Prop
  conjugacyProperty : Prop

structure BayesianInferenceEvidence {P : DTMProcessPackage} {K : KolmogorovExtensionPackage P} (B : BayesianInferencePackage P K) where
  posteriorComputedClosed : B.posteriorComputed
  conjugacyPropertyClosed : B.conjugacyProperty

def BayesianInferenceClosed {P : DTMProcessPackage} {K : KolmogorovExtensionPackage P} (B : BayesianInferencePackage P K) : Prop :=
  B.posteriorComputed ∧ B.conjugacyProperty

theorem bayesian_inference_closed_from_evidence {P : DTMProcessPackage} {K : KolmogorovExtensionPackage P} (B : BayesianInferencePackage P K) (E : BayesianInferenceEvidence B) :
    BayesianInferenceClosed B :=
  And.intro E.posteriorComputedClosed E.conjugacyPropertyClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse