#!/bin/sh

echo "run_id: $RUN_ID"

NOW=$(date +"%Y%m%d-%H%M%S")

if [ -z "${JM_HOME}" ]; then
  JM_HOME=/opt/perftest
fi

JM_SCENARIOS=${JM_HOME}/scenarios
JM_REPORTS=${JM_HOME}/reports
JM_LOGS=${JM_HOME}/logs

rm -f ${JM_REPORTS}/*.html ${JM_REPORTS}/*.json
rm -rf ${JM_REPORTS}/content ${JM_REPORTS}/sbadmin2*

mkdir -p ${JM_REPORTS} ${JM_LOGS}

if [ -z "${TEST_SCENARIO}" ]; then
  TEST_SCENARIO=test
fi

SCENARIOFILE=${JM_SCENARIOS}/${TEST_SCENARIO}.jmx
REPORTFILE=${NOW}-perftest-${TEST_SCENARIO}-report.csv
LOGFILE=${JM_LOGS}/perftest-${TEST_SCENARIO}.log

# run the jmeter suite (TODO: do we need to remove existing files/folders?)
jmeter -n -t ${SCENARIOFILE} -e -l "${REPORTFILE}" -o ${JM_REPORTS} -j ${LOGFILE}
test_exit_code=$?

if [ -n "$RESULTS_OUTPUT_S3_PATH" ]; then
   if [ -d "$DIRECTORY" ]; then
      aws s3 cp "$JM_REPORTS" "$RESULTS_OUTPUT_S3_PATH" --recursive
      echo "Test results published to $RESULTS_OUTPUT_S3_PATH"
   else
      echo "$JM_REPORTS is not found"
      exit 1
   fi
else
   echo "RESULTS_OUTPUT_S3_PATH is not set"
   exit 1
fi

exit $test_exit_code
