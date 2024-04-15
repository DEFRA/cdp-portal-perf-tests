#!/bin/sh

echo "run_id: $RUN_ID"

NOW=$(date +"%Y%m%d-%H%M%S")

if [ -z "${JM_HOME}" ]; then
  JM_HOME=/opt/perftest
fi
# JM_BIN=${JM_HOME}/bin
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
jmeter -n -t ${SCENARIOFILE} -e -l ${REPORTFILE} -o ${JM_REPORTS} -j ${LOGFILE}
test_exit_code=$?

# ./bin/publish-tests.sh
# publish_exit_code=$?

# if [ $publish_exit_code -ne 0 ]; then
#   echo "failed to publish test results"
#   exit $publish_exit_code
# fi

exit $test_exit_code
