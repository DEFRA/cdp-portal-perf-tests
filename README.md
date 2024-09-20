# cdp-portal-perf-tests

* [Development](#development)
  * [Run localStack](#run-localstack)
  * [Create bucket](#create-bucket)
  * [Build](#build)
  * [Run](#run)
* [Licence](#licence)
  * [About the licence](#about-the-licence)

## Development

### Run localStack

```bash
docker run --pull=always -d -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack:latest
```

### Create bucket

```bash
awslocal s3 mb s3://cdp-perf-test-test-results --endpoint-url http://localhost:4566
```

### Build

```
docker build --no-cache -t defradigital/cdp-portal-perf-tests .
```

### Run

```
docker run -e S3_ENDPOINT='http://host.docker.internal:4566' -e RESULTS_OUTPUT_S3_PATH='s3://cdp-perf-test-test-results/cdp-portal-perf-tests/a845a2f1-397d-439e-9ea0-e62bb7377e07' -e AWS_ACCESS_KEY_ID='test' -e AWS_SECRET_ACCESS_KEY='test' -e AWS_SECRET_KEY='test' -e AWS_REGION='eu-west-2' -e ENVIRONMENT='perf-test' defradigital/cdp-portal-perf-tests
```

## Licence

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government licence v3

### About the licence

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable
information providers in the public sector to license the use and re-use of their information under a common open
licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
