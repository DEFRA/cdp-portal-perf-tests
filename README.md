cdp-portal-perf-tests


- [Licence](#licence)
  - [About the licence](#about-the-licence)



## Build

```
docker build -t defra/cdp-portal-perftest .
```

## Run

```
docker run -it --rm -v $PWD/reports:/opt/perftest/reports defra/cdp-portal-perftest
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
