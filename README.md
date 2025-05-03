# bg3-prioritise-macos

A Bash script for Mac users to optimize performance when playing Baldur's Gate 3.

## Overview

This script automates the process of launching Baldur's Gate 3 and applies system-level optimizations to improve game performance. It works by:

1. Launching the BG3 game launcher
2. Monitoring for the actual game process to start
3. Applying high CPU priority to the game process
4. Optionally enabling the Metal performance HUD for tracking FPS

## Requirements

- macOS
- Baldur's Gate 3 installed on your system
- Administrative privileges (for the `sudo` command)

## Installation

1. Download the `bg3-prioritise-macos` script
2. Make the script executable:

    ```bash
    chmod +x bg3-prioritise-macos
    ```

3. Place it in a convenient location (e.g., `/usr/local/bin/` for system-wide access)

## Usage

### Basic Usage

Simply run the script to launch BG3 with performance optimizations:

```bash
./bg3-prioritise-macos
```

The script will:

- Launch the Baldur's Gate 3 launcher
- Wait for you to start the game from the launcher
- Automatically detect when the game starts
- Apply high priority (-20 nice value) to the game process

### Developer Mode

For developers or those wanting to see performance metrics, use the dev parameter:

```bash
./bg3-prioritise-macos dev
```

This will enable the Metal HUD (Heads-Up Display) showing performance metrics like framerate.

## How It Works

1. The script launches the BG3 launcher application
2. It monitors system processes, waiting for the actual BG3 game to start (not just the launcher)
3. Once detected, it uses `renice` with a value of -20 (highest priority) to ensure the game receives preferential CPU time
4. If in developer mode, it enables the Metal performance HUD through environment variables

## Notes

- The script requires sudo privileges to set process priority
- Maximum wait time for game detection is 60 seconds
- Progress updates are shown every 5 seconds while waiting

## Troubleshooting

- If you see "Timed out waiting for Baldur's Gate 3 to start," the script couldn't detect the game within 60 seconds
- Ensure the game is installed correctly and can be launched manually
- You may need to adjust the file path if your BG3 installation is in a non-standard location

## License

This script is provided as-is, free to use and modify for personal use.
