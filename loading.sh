# Load in the functions and animations
source ./bash_loading_animations.sh
# Run BLA::stop_loading_animation if the script is interrupted
trap BLA::stop_loading_animation SIGINT

BLA_passing_dots=( 0.25 '.  ' '.. ' '...' ' ..' '  .' '   ' )

declare -a BLA_active_loading_animation

BLA::play_loading_animation_loop() {
  while true ; do
    for frame in "${BLA_active_loading_animation[@]}" ; do
      printf "\r%s" "${frame}"
      sleep "${BLA_loading_animation_frame_interval}"
    done
  done
}

BLA::start_loading_animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from array BLA_active_loading_animation
  BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"
  unset "BLA_active_loading_animation[0]"
  tput civis # Hide the terminal cursor
  BLA::play_loading_animation_loop &
  BLA_loading_animation_pid="${!}"
}

BLA::stop_loading_animation() {
  kill "${BLA_loading_animation_pid}" &> /dev/null
  printf "\n"
  tput cnorm # Restore the terminal cursor
}

animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from the active_loading_animation array
  BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"
  # Sleep long enough that all frames are showed
  # substract 1 to the number of frames to account for index [0]
  demo_duration=$( echo "${BLA_active_loading_animation[0]} * ( ${#BLA_active_loading_animation[@]} - 1 )" | bc )
  # Make sure each animation is shown for at least 3 seconds
  if [[ $( echo "if (${demo_duration} < 3) 0 else 1" | bc ) -eq 0 ]] ; then
    demo_duration=3
  fi
  unset "BLA_active_loading_animation[0]"
  echo
  BLA::play_loading_animation_loop &
  BLA_loading_animation_pid="${!}"
  sleep "${demo_duration}"
  kill "${BLA_loading_animation_pid}" &> /dev/null
  # clear
}

tput civis # Hide the terminal cursor
# clear

animation "${BLA_passing_dots[@]}"