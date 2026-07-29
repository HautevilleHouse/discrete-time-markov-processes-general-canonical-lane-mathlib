import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

/-!
# Coalescent Theory Package

This module records the coalescent process, a continuous-time Markov chain that
models the ancestry of a sample of genes.
-/

structure CoalescentTheoryPackage (A : AdmissibleClass) where
  sampleSize : ℕ
  lineages : ℕ → Type u
  coalescenceRate : ℝ
  transitionRates : (k : ℕ) → lineages k → ℝ
  markovProperty : ∀ k : ℕ, ∀ l : lineages k, ∑' (l' : lineages (k-1)), transitionRates k l = 0? -- placeholder
  timeToMostRecentCommonAncestor : ℝ → Prop
  expectedTMRCA : ℝ
  expectedTMRCAComputed : expectedTMRCA > 0

structure CoalescentTheoryEvidence {A : AdmissibleClass} (C : CoalescentTheoryPackage A) where
  markovPropertyClosed : C.markovProperty
  expectedTMRCAComputedClosed : C.expectedTMRCAComputed

def CoalescentTheoryClosed {A : AdmissibleClass} (C : CoalescentTheoryPackage A) : Prop :=
  C.markovProperty ∧ C.expectedTMRCAComputed

theorem coalescent_theory_closed_from_evidence {A : AdmissibleClass} (C : CoalescentTheoryPackage A) (E : CoalescentTheoryEvidence C) :
    CoalescentTheoryClosed C := by
  exact And.intro E.markovPropertyClosed E.expectedTMRCAComputedClosed

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse