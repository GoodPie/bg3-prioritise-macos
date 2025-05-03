#!/bin/bash

# Launch the BG3 launcher
echo "Launching Baldur's Gate 3 launcher..."
open -a "Baldur's Gate 3"

echo "Please start the game from the launcher."
echo "This script will detect when the game starts and apply performance settings."

# TOGGLE Framerate and graph only if dev in process args
if [ "$1" == "dev" ]; then
    /bin/launchctl setenv MTL_HUD_ENABLED 1
    echo "Developer HUD enabled."
fi

# Wait for the actual game to start by repeatedly checking
echo "Waiting for game to start..."

MAX_WAIT=60  # Maximum wait time in seconds
COUNTER=0
BG3_PID=""

while [ $COUNTER -lt $MAX_WAIT ]; do
    # Look for the actual game process, not just the launcher
    BG3_PID=$(pgrep -f "Baldur's Gate 3")    
    
    if [ -n "$BG3_PID" ]; then
        echo "Baldur's Gate 3 detected with PID: $BG3_PID"
        break
    fi
    
    sleep 1
    COUNTER=$((COUNTER+1))
    
    # Show progress every 5 seconds
    if [ $((COUNTER % 5)) -eq 0 ]; then
        echo "Still waiting for game to start... ($COUNTER seconds elapsed)"
    fi
done

if [ -z "$BG3_PID" ]; then
    echo "Timed out waiting for Baldur's Gate 3 to start."
    exit 1
fi

# Set Renice to -20
echo "Setting high priority for game process..."
sudo renice -20 -p $BG3_PID
echo "Priority settings applied successfully!"
