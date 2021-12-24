#!/usr/bin/env bash

function save() {

  # Where all logs are stored
  PARENT_LOGS_FOLDER=~/.logs

  # Escaping the command string
  if [ "${#}" -eq 0 ]; then # if no parameters were provided
      echo "Usage: save [command with flags]"
  else
      # Wrapping around single quotes
      COMMAND="$(sed -e "s/'/'\\\\''/g; 1s/^/'/; \$s/\$/'/" <<< "${@}")"

      # Escaping
      COMMAND="_$(printf '%q' "${COMMAND}")"

      # Today's logs folder - one folder per day
      TODAY_LOGS="${PARENT_LOGS_FOLDER}"/$(date +%F)
      if [ ! -d "${TODAY_LOGS}" ]; then
        mkdir -p "${TODAY_LOGS}"
      fi

      # Creating the log file
      LOG_FILE="${TODAY_LOGS}"/$(date +%T)_"${COMMAND}".log
      touch "${LOG_FILE}"
      printf "Saving logs in %s\n-------------\n" "$(printf '%q' "${LOG_FILE}")"

      # Insert information in log file
      {
        printf "Command:\t%s\n" "${*}"
        printf "Date:\t\t%s\n" "$(date)"
        printf "PWD:\t\t%s\n" "$(pwd)"
      } >> "${LOG_FILE}"

      # Including the git branch name
      if [ -d .git ]; then
        printf "Git branch:\t%s\n" "$(git --no-pager branch)" >> "${LOG_FILE}"
      fi

      # Separation before command logs
      printf "\nCommand logs:\n-------------\n\n" >> "${LOG_FILE}"

      # Executing the command
      eval "${@}" 2>&1 | tee -a "${LOG_FILE}"
  fi
}
