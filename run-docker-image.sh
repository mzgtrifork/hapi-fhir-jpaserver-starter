#!/bin/sh

docker run \
       --name=hapi-fhir \
       --rm \
       -p 8080:8080 \
       -e HAPI_IMPLEMENTATION_GUIDE_URL=https://build.fhir.org/ig/hl7dk/dk-medcom/package.tgz \
       mzgtrifork/hapi-fhir-jpaserver-starter

# docker run \
#        --name=hapi-fhir \
#        --rm \
#        -p 8080:8080 \
#        -e HAPI_FHIR_VERSION=DSTU3 \
#        -e HAPI_IMPLEMENTATION_GUIDE_URL=https://docs.ehealth.sundhed.dk/latest/ig/package.tgz \
#        -e HAPI_TREAT_REFERENCES_AS_LOGICAL=http://ehealth.sundhed.dk/vs/*,http://ehealth.sundhed.dk/cs/* \
#        my-hapi-fhir-jpaserver-starter
