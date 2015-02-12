/**
 * This program is used for detecting regions of high intensity in grayscale images considering a rectangular geometry
 *
 * FORMAT OF INPUT FILE:
 * Image or text file (formatted according to output of MapCsvToInputFiles)
 *
 * FORMAT OF OUTPUT FILE:
 * If in debug mode, then also display results. Else only print them in a .csv/xml file.
 *
 * Author: Ovidiu Parvu
 * Date created: 18.03.2013
 * Date modified: 27.03.2013
 */

#include "multiscale/core/Multiscale.hpp"
#include "multiscale/analysis/spatial/detector/RegionDetector.hpp"
#include "multiscale/analysis/spatial/factory/RectangularMatFactory.hpp"
#include "multiscale/exception/ExceptionHandler.hpp"

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <boost/program_options.hpp>

#include <iostream>

using namespace multiscale;
using namespace multiscale::analysis;

namespace po = boost::program_options;
namespace pt = boost::property_tree;

const std::string CONFIG_FILE = "/usr/local/share/mule/config/analysis/spatial/rectangular_region_detector.xml";

const std::string LABEL_ROOT_COMMENT                      = "<xmlcomment>";
const std::string LABEL_ALPHA                             = "detector.alpha";
const std::string LABEL_BETA                              = "detector.beta";
const std::string LABEL_BLUR_KERNEL_SIZE                  = "detector.blurKernelSize";
const std::string LABEL_MORPHOLOGICAL_CLOSE_ITERATIONS    = "detector.morphologicalCloseIterations";
const std::string LABEL_EPSILON                           = "detector.epsilon";
const std::string LABEL_REGION_AREA_THRESH                = "detector.regionAreaThresh";
const std::string LABEL_THRESHOLD_VALUE                   = "detector.thresholdValue";

const std::string ROOT_COMMENT   = "Warning! This xml file was automatically generated by a C++ program using the Boost PropertyTree library.";


// Initialise the arguments configuration
po::variables_map initArgumentsConfig(po::options_description &usageDescription, int argc, char** argv) {
    usageDescription.add_options()("help,h"                                                             , "display help message\n")
                                  ("input-file,i"           , po::value<std::string>()                  , "provide the path to the input file\n")
                                  ("text-input-file,t"      , po::value<bool>()->implicit_value(true)   , "flag indicating if the input file type is text (true) or image (false); default flag value is true.\n")
                                  ("output-file,o"          , po::value<std::string>()                  , "provide the path of the output file (without extension)\n")
                                  ("debug-mode,d"           , po::value<bool>()->implicit_value(false)  , "start the program in debug mode\n");

    po::variables_map vm;

    po::store(po::parse_command_line(argc, argv, usageDescription), vm);
    po::notify(vm);

    return vm;
}

// Print help message if needed
void printHelpInformation(const po::variables_map &vm, const po::options_description &usageDescription) {
    std::cout << usageDescription << std::endl;
}

// Print error message if wrong parameters are provided
void printWrongParameters() {
    std::cout << ERR_MSG << "Wrong input arguments provided." << std::endl;
    std::cout << "Run the program with the argument \"--help\" for more information." << std::endl;
}

// Get the needed parameters
bool areValidParameters(std::string &inputFilepath, std::string &outputFilename,
                        bool &isTextInputFile, bool &isDebugMode, int argc, char** argv) {
    po::options_description usageDescription("Usage");

    po::variables_map vm = initArgumentsConfig(usageDescription, argc, argv);

    // Check if the user wants to print help information
    if (vm.count("help")) {
        printHelpInformation(vm, usageDescription);

        return false;
    }

    // Check if the given parameters are correct
    if ((vm.count("input-file")) && (vm.count("output-file"))) {
        inputFilepath  = vm["input-file"].as<std::string>();
        outputFilename = vm["output-file"].as<std::string>();

        // Update the input file type flag
        if (vm.count("text-input-file")) {
            isTextInputFile = vm["text-input-file"].as<bool>();
        }

        // Update the debug mode flag
        if (vm.count("debug-mode")) {
            isDebugMode = vm["debug-mode"].as<bool>();
        }

        return true;
    }

    return false;
}

// Load the values of the parameters from the config file
void loadDetectorParameterValues(RegionDetector &detector) {
    pt::ptree propertyTree;

    read_xml(CONFIG_FILE, propertyTree, pt::xml_parser::trim_whitespace);

    detector.setAlpha(propertyTree.get<int>(LABEL_ALPHA));
    detector.setBeta(propertyTree.get<int>(LABEL_BETA));
    detector.setBlurKernelSize(propertyTree.get<int>(LABEL_BLUR_KERNEL_SIZE));
    detector.setMorphologicalCloseIterations(propertyTree.get<int>(LABEL_MORPHOLOGICAL_CLOSE_ITERATIONS));
    detector.setEpsilon(propertyTree.get<int>(LABEL_EPSILON));
    detector.setRegionAreaThresh(propertyTree.get<int>(LABEL_REGION_AREA_THRESH));
    detector.setThresholdValue(propertyTree.get<int>(LABEL_THRESHOLD_VALUE));
}

// Save the values of the parameters to the config file
void saveDetectorParameterValues(RegionDetector &detector) {
    pt::ptree propertyTree;

    propertyTree.put<std::string>(LABEL_ROOT_COMMENT, ROOT_COMMENT);

    propertyTree.put<int>(LABEL_ALPHA, detector.getAlpha());
    propertyTree.put<int>(LABEL_BETA, detector.getBeta());
    propertyTree.put<int>(LABEL_BLUR_KERNEL_SIZE, detector.getBlurKernelSize());
    propertyTree.put<int>(LABEL_MORPHOLOGICAL_CLOSE_ITERATIONS, detector.getMorphologicalCloseIterations());
    propertyTree.put<int>(LABEL_EPSILON, detector.getEpsilon());
    propertyTree.put<int>(LABEL_REGION_AREA_THRESH, detector.getRegionAreaThresh());
    propertyTree.put<int>(LABEL_THRESHOLD_VALUE, detector.getThresholdValue());

    // Pretty writing of the property tree to the file
    pt::xml_writer_settings<char> settings('\t', 1);
    write_xml(CONFIG_FILE, propertyTree, std::locale(), settings);
}

// Load the values of the parameters from the config file if in debug mode
void loadDetectorParameterValues(RegionDetector &detector, bool debugMode) {
    loadDetectorParameterValues(detector);
}

// Save the values of the parameters to the config file if in debug mode
void saveDetectorParameterValues(RegionDetector &detector, bool debugMode) {
    if (debugMode) {
        saveDetectorParameterValues(detector);
    }
}

// Create a Mat instance from the given input file
cv::Mat createMatFromInputFile(const std::string &inputFilePath, bool isTextInputFile) {
    RectangularMatFactory factory;

    if (isTextInputFile) {
        return factory.createFromTextFile(inputFilePath);
    } else {
        return factory.createFromImageFile(inputFilePath);
    }
}

// Main function
int main(int argc, char** argv) {
    std::string inputFilePath;
    std::string outputFilepath;

    bool isTextInputFile = true;
    bool isDebugMode     = false;

    try {
        if (areValidParameters(inputFilePath, outputFilepath, isTextInputFile,
                               isDebugMode, argc, argv)) {
            cv::Mat image = createMatFromInputFile(inputFilePath, isTextInputFile);

            RegionDetector detector(isDebugMode);

            loadDetectorParameterValues(detector, isDebugMode);

            detector.detect(image);
            detector.outputResults(outputFilepath);

            saveDetectorParameterValues(detector, isDebugMode);
        } else {
            printWrongParameters();
        }
    } catch(const std::exception &e) {
        ExceptionHandler::printDetailedErrorMessage(e);

        return EXEC_ERR_CODE;
    } catch(...) {
        std::cerr << "Exception of unknown type!" << std::endl;
    }

    return EXEC_SUCCESS_CODE;
}