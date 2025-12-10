#!/bin/bash

# Nightfox theme for Tmux
# Based on the original nightfox tmux configurations

# shellcheck disable=SC2154
theme_set_nightfox() {
  local _left_status_a _right_status_x _right_status_y _right_status_z _statusbar_alpha
  _left_status_a=$1
  _right_status_x=$2
  _right_status_y=$3
  _right_status_z=$4
  _statusbar_alpha=$5

  tmux_append_seto "status" "on"

  # default statusbar bg color
  local _statusbar_bg="${col_bg}"
  if [[ "$_statusbar_alpha" == "true" ]]; then _statusbar_bg="default"; fi
  tmux_append_seto "status-style" "bg=${_statusbar_bg},fg=${col_fg}"

  # default window title colors
  local _window_title_bg=${col_blue}
  if [[ "$_statusbar_alpha" == "true" ]]; then _window_title_bg="default"; fi
  tmux_append_setwo "window-status-style" "bg=${_window_title_bg},fg=${col_bg}"

  # default window with an activity alert
  tmux_append_setwo "window-status-activity-style" "bg=${col_bg},fg=${col_gray0}"

  # active window title colors
  local _active_window_title_bg=${col_blue}
  if [[ "$_statusbar_alpha" == "true" ]]; then _active_window_title_bg="default"; fi
  tmux_append_setwo "window-status-current-style" "bg=${_active_window_title_bg},fg=${col_bg}"

  # pane border
  tmux_append_seto "pane-active-border-style" "fg=${col_blue}"
  tmux_append_seto "pane-border-style" "fg=${col_fg}"

  # message infos
  tmux_append_seto "message-style" "bg=${col_fg},fg=${col_bg}"

  # writing commands inactive
  tmux_append_seto "message-command-style" "bg=${col_gray0},fg=${col_bg}"

  # pane number display
  tmux_append_seto "display-panes-active-colour" "${col_blue}"
  tmux_append_seto "display-panes-colour" "${col_bg}"

  # clock
  tmux_append_setwo "clock-mode-colour" "${col_blue}"

  # bell
  tmux_append_setwo "window-status-bell-style" "bg=${col_red},fg=${col_bg}"

  # mode style
  tmux_append_seto "mode-style" "bg=${col_fg},fg=${col_bg}"

  ## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
  tmux_append_seto "status-justify" "left"
  tmux_append_seto "status-left-style" none
  tmux_append_seto "status-left-length" "100"
  tmux_append_seto "status-right-style" none
  tmux_append_seto "status-right-length" "100"
  tmux_append_setwo "window-status-separator" ""

  tmux_append_seto "status-left" "#[bg=${col_blue},fg=${col_bg},bold] ${_left_status_a} #[bg=${_statusbar_bg},fg=${col_blue},nobold,noitalics,nounderscore]"

  # right status
  local _status_right_bg=${_statusbar_bg}
  tmux_append_seto "status-right" "#[bg=${_status_right_bg},fg=${_status_right_bg},nobold,nounderscore,noitalics]#[bg=${_status_right_bg},fg=${col_blue}] #{prefix_highlight} #[bg=${_status_right_bg},fg=${col_fg},nobold,nounderscore,noitalics]#[bg=${col_fg},fg=${col_bg}] ${_right_status_x}  ${_right_status_y} #[bg=${col_fg},fg=${col_blue},nobold,noitalics,nounderscore]#[bg=${col_blue},fg=${col_bg},bold] ${_right_status_z}"

  # current window
  local _current_window_status_format_bg=${_statusbar_bg}
  tmux_append_setwo "window-status-current-format" "#[bg=${col_fg},fg=${col_bg},nobold,noitalics,nounderscore]#[bg=${col_fg},fg=${col_bg},bold] #I  #W#{?window_zoomed_flag,*Z,} #{?window_end_flag,#[bg=${_current_window_status_format_bg}],#[bg=${_statusbar_bg}]}#[fg=${col_fg},nobold,noitalics,nounderscore]"

  # default window
  local _default_window_status_format_bg=${_statusbar_bg}
  tmux_append_setwo "window-status-format" "#[bg=${col_gray0},fg=${col_bg},noitalics]#[bg=${col_gray0},fg=${col_fg}] #I  #W #{?window_end_flag,#[bg=${_default_window_status_format_bg}],#[bg=${_statusbar_bg}]}#[fg=${col_gray0},noitalics]"
}
