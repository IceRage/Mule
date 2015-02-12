#ifndef NUMERICSTATEVARIABLEATTRIBUTE_HPP
#define NUMERICSTATEVARIABLEATTRIBUTE_HPP

#include "multiscale/verification/spatial-temporal/attribute/StateVariableAttribute.hpp"
#include "multiscale/verification/spatial-temporal/attribute/SemanticTypeAttribute.hpp"

#include <boost/fusion/include/adapt_struct.hpp>
#include <boost/optional.hpp>


namespace multiscale {

    namespace verification {

        //! Class for representing a numeric state variable attribute
        class NumericStateVariableAttribute {

            public:

                StateVariableAttribute
                    stateVariable;  /*!< The state variable */
                boost::optional<SemanticTypeAttribute>
                    semanticType;   /*!< The semantic type */

        };

    };

};


BOOST_FUSION_ADAPT_STRUCT(
    multiscale::verification::NumericStateVariableAttribute,
    (multiscale::verification::StateVariableAttribute, stateVariable)
    (boost::optional<multiscale::verification::SemanticTypeAttribute>, semanticType)
)


#endif
