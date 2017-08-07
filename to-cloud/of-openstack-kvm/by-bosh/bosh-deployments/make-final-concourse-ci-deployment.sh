#!/bin/bash

<<PSEUDO
MODIFY concourse-stub.yml

spiff merge concourse-template.yml openstack-stub.yml director-stub.yml concourse-stub.yml > concourse-deployment.yml
PSEUDO
