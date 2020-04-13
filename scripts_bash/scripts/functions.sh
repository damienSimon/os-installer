#!/bin/bash

extract_minutes_secondes_from_duration () {

  STARTTIME=$1
  ENDTIME=$2

  # Convert Seconds to Hours, Minutes, Seconds
  # Optional second argument of "long" makes it display
  # the longer format, otherwise short format.
  local SECONDS H M S MM H_TAG M_TAG S_TAG
  SECONDS=${1:-0}
  let S=${SECONDS}%60
  let MM=${SECONDS}/60 # Total number of minutes
  let M=${MM}%60
  let H=${MM}/60

  let DURATION=$(($ENDTIME - $STARTTIME))
  let SECONDES=${DURATION}%60
  let MINUTES_TEMP=${DURATION}/60
  let MINUTES=${MINUTES_TEMP}%60
  let HEURES=${MINUTES_TEMP}/60

  # Display "1 hour, 2 minutes and 3 seconds" format
  # Using the x_TAG variables makes this easier to translate; simply appending
  # "s" to the word is not easy to translate into other languages.
  [ "$HEURES" -eq "1" ] && H_TAG="heure" || H_TAG="heures"
  [ "$MINUTES" -eq "1" ] && M_TAG="minute" || M_TAG="minutes"
  [ "$SECONDES" -eq "1" ] && S_TAG="seconde" || S_TAG="secondes"
  [ "$HEURES" -gt "0" ] && printf "%d %s " $HEURES "${H_TAG},"
  [ "$MINUTES" -gt "0" ] && printf "%d %s " $MINUTES "${M_TAG} et"
  printf "%d %s\n" $SECONDES "${S_TAG}"
}