#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#==============================================================================
# mkexec.sh
# v1.1.0
# Makes given file executable (via `chmod +x`).
# Updated 08/23/2023
# By Matthew Daniel Brown
# Copyright (c) 2023. All Rights Reserved.
#------------------------------------------------------------------------------
# NAME
# 	mkexec
#
# Version
# 	0.1.1
# 
# DESC
# 	Makes a given file an executable, via `chmod +x`.
#
# USAGE
# 	$ mkexec [FILE]
#   $ mkexec -h | --help
#   $ mkexec -v | --version
#==============================================================================

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# # # Unsets # # #
unset SCRIPT_NAME
unset SCRIPT_VERSION
unset SCRIPT_PARAMETERS
unset UNCHECKED_TARGET_FILE
unset CHECKED_TARGET_FILE
unset TARGET_FILE
unset TARGET_EXISTS
unset TARGET_IS_FILE

# # # Utility Variables # # #
SCRIPT_NAME="$(basename "$0")"
SCRIPT_VERSION="1.1.0"

# # # Script Variables # # #
UNCHECKED_TARGET_FILE="$1"
CHECKED_TARGET_FILE=""
TARGET_FILE=""
TARGET_EXISTS=false
TARGET_IS_FILE=false

#------------------------------------------------------------------------------
# Utility Functions
#------------------------------------------------------------------------------

function exit_cleanly {
  exit 0
}

function show_help_message {

  local HELP_MESSAGE_TEXT

  local highlight
  local cyanColor
  local errorColor
  local warningColor
  local successColor
  local normalText

  highlight=$(echo -en '\033[01;37m')
  cyanColor=$(echo -en '\033[01;36m')
  errorColor=$(echo -en '\033[01;31m')
  warningColor=$(echo -en '\033[00;33m')
  successColor=$(echo -en '\033[01;32m')
  normalText=$(echo -en '\033[0m')
  

  HELP_MESSAGE_TEXT="
 ${highlight}NAME${normalText}
   ${cyanColor}${SCRIPT_NAME}${normalText}

 ${highlight}Version${normalText}
   ${SCRIPT_VERSION}

 ${highlight}DESC${normalText}
   Makes a given file an executable, via ${warningColor}\`chmod +x\`${normalText}.

 ${highlight}USAGE${normalText}
   ${successColor}\$${normalText} ${highlight}mkexec${normalText} ${warningColor}[FILE] ${normalText}
  "
  printf "\n%s\n\n" "$HELP_MESSAGE_TEXT"
}

function show_help_message_and_exit {
  show_help_message
  exit_cleanly
}

function show_version () {
  printf "v%s\n\n" "$SCRIPT_VERSION"
}

function show_version_and_exit {
  show_version
  exit_cleanly
}

function check_there_is_input() {
  local FUNCTION_ARG
  FUNCTION_ARG="$@"
  _file="$FUNCTION_ARG"
  [[ "$_file" == "" ]] && { echo -e "Target file to make executable not supplied. \nUSAGE: ${SCRIPT_NAME} file.ext "; exit 1; }
}

function exit_with_error_one() {
  local FUNCTION_ARG_ONE
  local FUNCTION_ARG_TWO
  local ERROR_MESSAGE
  local EXIT_CODE

  FUNCTION_ARG_ONE="$1"
  FUNCTION_ARG_TWO="$2" 
  if [[ -n "$2" ]]; then
    FUNCTION_ARG_TWO="$2"
  else
    FUNCTION_ARG_TWO=1
  fi
  
  ERROR_MESSAGE="$FUNCTION_ARG_ONE"
  EXIT_CODE=$FUNCTION_ARG_TWO

  printf "\n %s\n" "Error... ${ERROR_MESSAGE}"
  show_help_message
  exit "$EXIT_CODE"
}

function bold_text() {
  echo -e -n "\e[1m${*}\e[0m"
}

function show_message_for_result() {
  local RESULT
  local TARGET_FILEPATH
  local STYLED_RESULT_MESSAGE
  RESULT="$1"
  TARGET_FILEPATH="$2"
  STYLED_RESULT_MESSAGE=""




  local highlight
  local cyanColor
  local errorColor
  local warningColor
  local successColor
  local normalText

  highlight=$(echo -en '\033[01;37m')
  cyanColor=$(echo -en '\033[01;36m')
  errorColor=$(echo -en '\033[01;31m')
  warningColor=$(echo -en '\033[00;33m')
  successColor=$(echo -en '\033[01;32m')
  normalText=$(echo -en '\033[0m') 


  if [ "$RESULT" == "success" ]; then
    STYLED_RESULT_MESSAGE="${successColor}Successfully${normalText} made ${cyanColor}${TARGET_FILEPATH}${normalText} ${highlight}executable${normalText}."
  else
     STYLED_RESULT_MESSAGE="${errorColor}Failed${normalText} to make ${warningColor}${TARGET_FILEPATH}${normalText} ${highlight}executable${normalText}."
  fi
  
  printf "%s\n" "$STYLED_RESULT_MESSAGE"
}

#------------------------------------------------------------------------------
# Script Functions
#------------------------------------------------------------------------------

getFileName(){
  if [ $# -ne 1 ]; then 
    echo "Invalid number of parameters"
    return >/dev/null 2>&1 && return 1 ||exit 1
  fi
  echo "$( basename "$1" )"
}

function check_if_is_file() {
  
  if test -f "$1"
  then
    TARGET_IS_FILE=true
  else
    TARGET_IS_FILE=false
  fi
}

function check_file_exists() {

  local FUNCTION_ARG
  FUNCTION_ARG="$*"

  if test -f "$FUNCTION_ARG"
  then
    TARGET_EXISTS=true
  else
    TARGET_EXISTS=false
  fi
}

function make_file_executable() {
  local FUNCTION_ARG
  FUNCTION_ARG="$1" 
  chmod +x "$FUNCTION_ARG"
}

function handle_options_and_arguments() {
  
  local SCRIPT_ARGS
  SCRIPT_ARGS="$*"


 case "${SCRIPT_ARGS}" in
  "-h"|"--help")
    show_help_message_and_exit
  ;;
  "-v"|"--version")
    show_version_and_exit
  ;;
  *)
    check_there_is_input "$SCRIPT_ARGS"
  ;;
  esac
 

  # check_there_is_input "$SCRIPT_ARGS"
  # check_file_exists "$SCRIPT_ARGS"
  # check_if_is_file "$SCRIPT_ARGS"
  
  FILE="$HOME/bin/Tests/mkexecTests/foo.sh"
  NAME=$(basename "$1")
  
  # echo -e "Filepath: $1"
  # echo -e "Filename: $NAME"
  
  pathToSomething="$1"
  WEAREHERE="$(pwd)"
  # echo -e "CURRENT DIRECTORY: ${WEAREHERE}"
  FULLFILEPATH="${WEAREHERE}/${NAME}"
  filePath="$FULLFILEPATH"



  local highlight
  local cyanColor
  local errorColor
  local warningColor
  local successColor
  local normalText

  highlight=$(echo -en '\033[01;37m')
  cyanColor=$(echo -en '\033[01;36m')
  errorColor=$(echo -en '\033[01;31m')
  warningColor=$(echo -en '\033[00;33m')
  successColor=$(echo -en '\033[01;32m')
  normalText=$(echo -en '\033[0m')

  if [ ! -e "${pathToSomething}" ]; then
    # echo "Path \"${pathToSomething}\" exists"
    echo -e "Path \"${pathToSomething}\" does not exist (or was not found)."
    exit 1    
  fi

  if [ -h "${1}" ]; then
    echo "Invalid filepath supplied. Path \"${1}\" is a symbolic link"
    exit 1
  fi

  if [ ! -f "${1}" ]; then
    # echo "File \"${1}\" exists..."
    echo "Error..."
    echo -e "File \"${1}\" does not exist, or was not found..."
    exit 1
  fi

  if [ -x "${filePath}" ]; then
    echo -e "${errorColor}Error...${normalText} \nfile \"${highlight}${filePath}${normalText}\" ${warningColor}is already executable.${normalText}"
    exit 1
  fi
  
  

  if make_file_executable "$1"; then
    show_message_for_result "success" "$1"
  else
    show_message_for_result "failure" "$1"
  fi
   
}


#------------------------------------------------------------------------------
# Main Function
#------------------------------------------------------------------------------

main() {
  handle_options_and_arguments "$*"
}

#------------------------------------------------------------------------------
# Script Runtime
#------------------------------------------------------------------------------
main "$*"

#==============================================================================
# SCRIPT END
#==============================================================================

