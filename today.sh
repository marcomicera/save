#!/usr/bin/env bash

function today() {

  # Where all logs are stored
  PARENT_LOGS_FOLDER=~/.logs

  # Today's logs folder - one folder per day
  TODAY_LOGS="${PARENT_LOGS_FOLDER}"/$(date +%F)

  # cd into today's folder
  cd "${TODAY_LOGS}" || exit
}
