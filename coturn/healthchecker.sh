#!/bin/bash -ue
turnutils_uclient -t -p 3478 -u ${TURN_USERNAME} -w ${TURN_PASSWORD} 127.0.0.1 && exit 0 || exit 1
