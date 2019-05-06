#!/bin/bash

DAWN_FILE='/home/bob/dawn_ramadan_2019.txt'
SUNSET_FILE='/home/bob/sunset_ramadan_2019.txt'
CURR_MONTH_DAY=$(date | awk '{print $2,$3}')
LOG_FILE='/tmp/ramadan_2019.txt'
ATHAN_FILE='/home/bob/Music/athan2.mp4'

if [[ $1 == "dawn" ]]; then
  date  >> ${LOG_FILE}
  ALARM_DATE="$(grep "${CURR_MONTH_DAY}" ${DAWN_FILE})"
  ALARM_TIME="$(echo ${ALARM_DATE} | awk '{print $3}')"
  VOULME="40"
elif [[ $1 == "sunset" ]]; then
  date  >> ${LOG_FILE}
  ALARM_DATE="$(grep "${CURR_MONTH_DAY}" ${SUNSET_FILE})"
  ALARM_TIME="$(echo ${ALARM_DATE} | awk '{print $3}')"
  VOULME="100"
else
  date  >> ${LOG_FILE}
  echo "the Ramadan script is failed!" >> ${LOG_FILE}
  echo "Please provide the script with either 'dawn' or 'sunset' values"
  exit
fi

while true; do
  if [[ ${ALARM_TIME} == $(date | awk '{print $4}') ]]; then
    date  >> ${LOG_FILE}
    bash -c "amixer -D pulse sset Master ${VOULME}\%; DISPLAY=:0 cvlc ${ATHAN_FILE}; exit" 
  fi
done

