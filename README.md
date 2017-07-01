# inspectit-platform-docker

## Changes for DukeCon measurements

* Enable EUM version of inspectIT (Monitor JavaScript frontend)
* Prepare to build: Add inspectit-cmr.jar and libs/inspectit*.jar from CMR distribution to cmr/ folder as CMR/
* It is only necessary to build dukecon/inspectit_cmr (`docker-compose build cmr`)
* Startup is performed via dukecon/dukecon_infra-Project (see Puppet manifests)
