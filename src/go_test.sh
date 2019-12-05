#!/bin/bash

function gotest {
  # Gather the output of `terraform apply`.
  echo "gotest: info: Run Terratest in ${tfWorkingDir}"
  gotest=$(go test -run Test --timeout 150m -input=false ${*} 2>&1)
  gotestExitCode=${?}
  gotestCommentStatus="Failed"

  # Exit code of 0 indicates success. Print the output and exit.
  if [ ${gotestExitCode} -eq 0 ]; then
    echo "gotest: info: successfully Run Terratest in ${tfWorkingDir}"
    echo "${gotest}"
    echo
    gotestStatus="Success"
  fi

  # Exit code of !0 indicates failure.
  if [ ${gotestCode} -ne 0 ]; then
    echo "gotest: error: failed Terratest in ${tfWorkingDir}"
    echo "${gotest}"
    echo
  fi


  exit ${gotestExitCode}
}
