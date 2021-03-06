#ifndef BINARYSTATISTICALMEASUREGRAMMARDEFINITION_HPP
#define BINARYSTATISTICALMEASUREGRAMMARDEFINITION_HPP

#include "multiscale/verification/spatial-temporal/parsing/BinaryStatisticalMeasureGrammar.hpp"

#include <boost/config/warning_disable.hpp>
#include <boost/spirit/include/qi.hpp>

#include <string>


namespace multiscale {

    namespace verification {

        template <typename Iterator>
        BinaryStatisticalMeasureGrammar<Iterator>::BinaryStatisticalMeasureGrammar()
            : BinaryStatisticalMeasureGrammar::base_type(
                                                   binaryStatisticalMeasureRule,
                                                   "binaryStatisticalMeasureRule"
                                               ) {
            initialize();
        }

        //! Initialisation function
        template <typename Iterator>
        void BinaryStatisticalMeasureGrammar<Iterator>::initialize() {
            initializeGrammar();
            initializeDebugSupport();
        }

        //! Initialize the grammar
        template <typename Iterator>
        void BinaryStatisticalMeasureGrammar<Iterator>::initializeGrammar() {
            binaryStatisticalMeasureRule
                =   binaryStatisticalMeasureTypeParser;
        }

        //! Initialize debug support
        template <typename Iterator>
        void BinaryStatisticalMeasureGrammar<Iterator>::initializeDebugSupport() {
            assignNamesToRules();

            // TODO: Uncomment this function call in case of debugging
            // initializeRulesDebugging();
        }

        //! Assign names to the rules
        template <typename Iterator>
        void BinaryStatisticalMeasureGrammar<Iterator>::assignNamesToRules() {
            binaryStatisticalMeasureRule.name("binaryStatisticalMeasureRule");
        }

        //! Initialize the debugging of rules
        template <typename Iterator>
        void BinaryStatisticalMeasureGrammar<Iterator>::initializeRulesDebugging() {
            debug(binaryStatisticalMeasureRule);
        }

    };

};


#endif
