#!/bin/sh

echo "run_id: $RUN_ID"

# run the jmeter suite (TODO: do we need to remove existing files/folders?)
jmeter -n -t test.jmx -e -l report.csv -o reports
test_exit_code=$?

./bin/publish-tests.sh
publish_exit_code=$?

if [ $publish_exit_code -ne 0 ]; then
  echo "failed to publish test results"
  exit $publish_exit_code
fi

exit $test_exit_code
