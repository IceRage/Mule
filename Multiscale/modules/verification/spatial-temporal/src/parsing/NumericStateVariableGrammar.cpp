#include "multiscale/verification/spatial-temporal/parsing/NumericStateVariableGrammarDefinition.hpp"

using namespace multiscale::verification;


// Define the iterator type
typedef std::string::const_iterator iteratorType;

// Explicitly instantiate the template for the given iterator type
template class NumericStateVariableGrammar<iteratorType>;
