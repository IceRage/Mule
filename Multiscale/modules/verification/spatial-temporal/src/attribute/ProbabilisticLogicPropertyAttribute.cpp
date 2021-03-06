#include "multiscale/verification/spatial-temporal/attribute/ProbabilisticLogicPropertyAttribute.hpp"
#include "multiscale/verification/spatial-temporal/exception/SpatialTemporalException.hpp"

using namespace multiscale::verification;


ComparatorType ProbabilisticLogicPropertyAttribute::getComparator() {
    return comparator.comparatorType;
}

double ProbabilisticLogicPropertyAttribute::getProbability() {
    return probability;
}

bool ProbabilisticLogicPropertyAttribute::evaluate(SpatialTemporalTrace &trace,
                                                   const MultiscaleArchitectureGraph &multiscaleArchitectureGraph) {
    if (trace.length() == 0) {
        MS_throw(SpatialTemporalException, ERR_TRACE_LENGTH_ZERO);
    }

    // Pass the copy of the spatial-temporal trace to the LogicPropertyVisitor
    return (
        boost::apply_visitor(
            LogicPropertyVisitor(
                trace,
                multiscaleArchitectureGraph
            ),
            logicProperty,
            evaluationLogicProperty
        )
    );
}


// Constants
const std::string ProbabilisticLogicPropertyAttribute::ERR_TRACE_LENGTH_ZERO = "The length of the trace provided for evaluating the probabilistic logic property is zero. Please provide a trace which contains at least one time point.";
