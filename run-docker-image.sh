#!/bin/sh

# ---
# Medcom R4 IG - Valid

# docker run \
#        --name=hapi-fhir \
#        --rm \
#        -p 8080:8080 \
#        -e HAPI_IMPLEMENTATION_GUIDE_URL=https://build.fhir.org/ig/hl7dk/dk-medcom/package.tgz \
#        mzgtrifork/hapi-fhir-jpaserver-starter:0.0.1

# ---
# FUT DSTU3 IG - Erroneous!

# docker run \
#        --name=hapi-fhir \
#        --rm \
#        -p 8080:8080 \
#        -e HAPI_FHIR_VERSION=DSTU3 \
#        -e HAPI_IMPLEMENTATION_GUIDE_URL=https://docs.ehealth.sundhed.dk/latest/ig/package.tgz \
#        -e HAPI_TREAT_REFERENCES_AS_LOGICAL=http://ehealth.sundhed.dk/vs/*,http://ehealth.sundhed.dk/cs/* \
#        mzgtrifork/hapi-fhir-jpaserver-starter:0.0.1

# ---
# NHSD DSTU3 IG - Valid

docker run \
       --name=hapi-fhir \
       --rm \
       -p 8080:8080 \
       -e HAPI_FHIR_VERSION=DSTU3 \
       -e HAPI_IMPLEMENTATION_GUIDE_ID=NHSD.Assets.STU3 \
       -e HAPI_IMPLEMENTATION_GUIDE_VERSION=1.0.0 \
       mzgtrifork/hapi-fhir-jpaserver-starter:0.0.1
