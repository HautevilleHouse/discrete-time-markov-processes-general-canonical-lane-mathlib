import DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean.StationaryDistribution
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean

structure ErgodicityPackage {P : DTMProcessPackage} {S : StationaryDistributionPackage P} where
  irreducible : Prop
  aperiodic : Prop
  positiveRecurrent : Prop
  ergodicTheoremHolds : Prop

structure ErgodicityEvidence {P : DTMProcessPackage} {S : StationaryDistributionPackage P} (E : ErgodicityPackage P S) where
  irreducibleClosed : E.irreducible
  aperiodicClosed : E.aperiodic
  positiveRecurrentClosed : E.positiveRecurrent
  ergodicTheoremHoldsClosed : E.ergodicTheoremHolds

def ErgodicityClosed {P : DTMProcessPackage} {S : StationaryDistributionPackage P} (E : ErgodicityPackage P S) : Prop :=
  E.irreducible ∧ E.aperiodic ∧ E.positiveRecurrent ∧ E.ergodicTheoremHolds

theorem ergodicity_closed_from_evidence {P : DTMProcessPackage} {S : StationaryDistributionPackage P} (E : ErgodicityPackage P S) (Ev : ErgodicityEvidence E) :
    ErgodicityClosed E :=
  And.intro Ev.irreducibleClosed (And.intro Ev.aperiodicClosed (And.intro Ev.positiveRecurrentClosed Ev.ergodicTheoremHoldsClosed))

end DiscreteTimeMarkovProcessesGeneralCanonicalLaneLean
end HautevilleHouse