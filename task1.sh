#!/bin/bash
# The easiest way is
# pkill -f "infinite.sh" which is problem specific, also required by the hw4.

# Check if a process name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <process_name>"
    read -p "Press to continue..."
    exit 1
fi

# Find the process ID (PID) using pgrep
PID=$(pgrep "$1")

# Check if the process is running
if [ -z "$PID" ]; then
    echo "No process found with name: $1"
    read -p "Press to continue..."
    exit 1
else
    # Kill the process
    kill "$PID"
    echo "Process $1 (PID: $PID) has been killed!"
    read -p "Press to continue..."
fi