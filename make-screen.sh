#!/bin/bash

tmux new -s hacker
tmux send-keys "termsaver clock" C-m
tmux split-window -v
tmux send-keys "./infinite-secrets.sh" C-m
tmux split-window -h
tmux send-keys "termsaver matrix" C-m