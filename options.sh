#!/bin/bash

main() {

while getopts ":a:b:" opt; do
  case $opt in
    a)
      echo "Option -a was triggered, Parameter: $OPTARG"
      ;;
    b)
      echo "Option -b was triggered, Parameter: $OPTARG"
      ;;
    \?) # Catches invalid options
      echo "Invalid option: -$OPTARG" >&2
      exit 2
      ;;
    :) # Catches missing arguments for options that require one
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

}

: <<'COMMENT_END'
Leading Colon (e.g., ":a:b")
A colon as the very first character of the optstring enables "silent error reporting mode".
This suppresses the default diagnostic messages that getopts automatically prints for invalid
options or missing arguments, allowing you to handle all errors manually within your script's logic. 

In silent mode:
* Missing argument: The option variable is set to a colon (:), and $OPTARG contains the option
character that was missing an argument.
* Invalid/unknown option: The option variable is set to ? (question mark), and $OPTARG contains
the unknown option character. 

This provides more control over error handling, which is usually preferred for professional scripts. 
COMMENT_END

main "$@"
