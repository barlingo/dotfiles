#!/bin/bash
#   Switches between soundcards when run. All streams are moved to the new default sound-card.

# $totalsc: Number of sound cards available
totalsc=$(pacmd "list-sinks" | grep card: | wc -l) # total of sound cards: $totalsc
if [ $totalsc -le 1 ]; then # Check whether there are actually multiple cards available
  exit
fi
# $scindex: The Pulseaudio index of the current default sound card
scindex=$(pacmd list-sinks | awk '$1 == "*" && $2 == "index:" {print $3}')
# $cards: A list of card Pulseaudio indexes
cards=$(pacmd list-sinks | sed 's|*||' | awk '$1 == "index:" {print $2}')
PICKNEXTCARD=1 # Is true when the previous card is default
count=0 # count of number of iterations
for CARD in $cards; do
  if [ $PICKNEXTCARD == 1 ]; then
# $nextsc: The pulseaudio index of the next sound card (to be switched to)
    nextsc=$CARD
    PICKNEXTCARD=0
# $nextind: The numerical index (1 to totalsc) of the next card
    nextind=$count
  fi
  if [ $CARD == $scindex ]; then # Choose the next card as default
    PICKNEXTCARD=1
  fi
  count=$((count+1))
done
pacmd "set-default-sink $nextsc" # switch default sound card to next

# $inputs: A list of currently playing inputs
inputs=$(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
for INPUT in $inputs; do # Move all current inputs to the new default sound card
  pacmd move-sink-input $INPUT $nextsc
done
exit
