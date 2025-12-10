#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CURRENT_DIR

# hold the array of all command to configure tmux theme
declare -a TMUX_CMDS

# load libraries
# shellcheck disable=1091
source "${CURRENT_DIR}/helper_methods.sh"
# shellcheck disable=1091
source "${CURRENT_DIR}/tmux_utils.sh"

readonly TMUX_NIGHTFOX="@tmux-nightfox"
readonly TMUX_NIGHTFOX_STATUSBAR_ALPHA="@tmux-nightfox-statusbar-alpha"
readonly TMUX_NIGHTFOX_LEFT_STATUS_A="@tmux-nightfox-left-status-a"
readonly TMUX_NIGHTFOX_RIGHT_STATUS_X="@tmux-nightfox-right-status-x"
readonly TMUX_NIGHTFOX_RIGHT_STATUS_Y="@tmux-nightfox-right-status-y"
readonly TMUX_NIGHTFOX_RIGHT_STATUS_Z="@tmux-nightfox-right-status-z"

# define simple theme options (no color interpolation required)
readonly DEFAULT_THEME="nightfox"
readonly DEFAULT_STATUSBAR_ALPHA='false'
# defaults for theme option (with color interpolation)
readonly DEFAULT_LEFT_STATUS_A='#S'
readonly DEFAULT_RIGHT_STATUS_X='%Y-%m-%d'
readonly DEFAULT_RIGHT_STATUS_Y='%H:%M'
readonly DEFAULT_RIGHT_STATUS_Z='#h'

main() {
  TMUX_CMDS=() # clear

  # load proper palette for the theme asap to avoid additional variable interpolation
  local _theme
  _theme=$(tmux_get_option "${TMUX_NIGHTFOX}" "${DEFAULT_THEME}")
  _statusbar_alpha=$(tmux_get_option "${TMUX_NIGHTFOX_STATUSBAR_ALPHA}" "${DEFAULT_STATUSBAR_ALPHA}")

  case "$_theme" in
  carbonfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_carbonfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  dawnfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_dawnfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  dayfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_dayfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  duskfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_duskfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  nightfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_nightfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  nordfox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_nordfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  terafox)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_terafox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  *)
    # shellcheck disable=1091
    source "${CURRENT_DIR}/palette_nightfox.sh"
    # shellcheck disable=1091
    source "${CURRENT_DIR}/theme_nightfox.sh"
    ;;
  esac

  local _status_left _status_right _window_status_current_format _window_status_format
  _status_left_a=$(tmux_get_option "$TMUX_NIGHTFOX_LEFT_STATUS_A" "$DEFAULT_LEFT_STATUS_A")
  _status_right_x=$(tmux_get_option "$TMUX_NIGHTFOX_RIGHT_STATUS_X" "$DEFAULT_RIGHT_STATUS_X")
  _status_right_y=$(tmux_get_option "$TMUX_NIGHTFOX_RIGHT_STATUS_Y" "$DEFAULT_RIGHT_STATUS_Y")
  _status_right_z=$(tmux_get_option "$TMUX_NIGHTFOX_RIGHT_STATUS_Z" "$DEFAULT_RIGHT_STATUS_Z")

  local _theme_args
  _theme_args=(
    "$_status_left_a"
    "$_status_right_x"
    "$_status_right_y"
    "$_status_right_z"
    "$_statusbar_alpha"
  )

  theme_set_nightfox "${_theme_args[@]}"

  # execute commands with tmux as array of options
  tmux "${TMUX_CMDS[@]}"
}

main "$@"
