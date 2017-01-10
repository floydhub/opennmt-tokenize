#!/bin/bash

# Bash wrapper to invoe OpenNMT's tokenize script
# For more details, see https://github.com/OpenNMT/OpenNMT/tree/master/tools

# Reading in command line arguments
for i in "$@"
do
case $i in
    -i=*|--input=*)
    INPUT="${i#*=}"
    shift # past argument=value
    ;;
    -o=*|--output=*)
    OUTPUT="${i#*=}"
    shift # past argument=value
    ;;
    -mode=*|--mode=*)
    MODE="-mode ${i#*=}"
    shift # past argument=value
    ;;
    -sep_annonate=*|--sep_annonate=*)
    value="${i#*=}"
    shopt -s nocasematch
    case "$value" in
        "true") SEP_ANNONATE="-sep_annonate";;
        *) SEP_ANNONATE="";;
    esac
    shift # past argument=value
    ;;
    -case_feature=*|--case_feature=*)
    value="${i#*=}"
    shopt -s nocasematch
    case "$value" in
        "true") CASE_FEATURE="-case_feature";;
        *) CASE_FEATURE="";;
    esac
    shift # past argument=value
    ;;
    -bpe_model=*|--bpe_model=*)
    value="${i#*=}"
    shopt -s nocasematch
    case "$value" in
        "true") BPE_MODEL="-bpe_model";;
        *) BPE_MODEL="";;
    esac
    shift # past argument=value
    ;;
    # --default)
    # DEFAULT=YES
    # shift # past argument with no value
    # ;;
    *)
    # unknown option
    ;;
esac
done

echo "MODE = ${MODE}"
echo "SEP_ANNONATE = ${SEP_ANNONATE}"
echo "CASE_FEATURE = ${CASE_FEATURE}"
echo "BPE_MODEL = ${BPE_MODEL}"

cd ~/opennmt
th tools/tokenize.lua ${MODE} ${SEP_ANNONATE} ${CASE_FEATURE} ${BPE_MODEL} < ${INPUT} > ${OUTPUT}