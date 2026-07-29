import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

/-!
# Phylogenetics Package

This module records the continuous-time Markov chain model for nucleotide
substitution used in phylogenetics (e.g., Jukes-Cantor).
-/

structure PhylogeneticsPackage (A : AdmissibleClass) where
  nucleotides : Type u
  rateMatrix : nucleotides → nucleotides → ℝ
  transitionProbabilities : ℕ → nucleotides → nucleotides → ℝ
  markovProperty : ∀ n : ℕ, ∀ i : nucleotides, ∑' (j : nucleotides), transitionProbabilities n i j = 1
  stationarity : ∃ π : nucleotides → ℝ, (∀ n : ℕ, ∀ i : nucleotides, π i = ∑' (j : nucleotides), π j * transitionProbabilities n j i) ∧ ∑' (i : nucleotides), π i = 1
  timeReversibility : ∀ (i j : nucleotides), π i * rateMatrix i j = π j * rateMatrix j i

structure PhylogeneticsEvidence {A : AdmissibleClass} (P : PhylogeneticsPackage A) where
  markovPropertyClosed : P.markovProperty
  stationarityClosed : P.stationarity
  timeReversibilityClosed : P.timeReversibility

def PhylogeneticsClosed {A : AdmissibleClass} (P : PhylogeneticsPackage A) : Prop :=
  P.markovProperty ∧ P.stationarity ∧ P.timeReversibility

theorem phylogenetics_closed_from_evidence {A : AdmissibleClass} (P : PhylogeneticsPackage A) (E : PhylogeneticsEvidence P) :
    PhylogeneticsClosed P := by
  exact And.intro E.markovPropertyClosed (And.intro E.stationarityClosed E.timeReversibilityClosed)

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse