# README for run_rye.sh

## Overview

run_rye.sh is a Bash script designed to streamline the setup and management of Python projects using Rye. It provides a user-friendly interface to initialize new projects, manage dependencies, synchronize the project environment, and commit changes to Git. This script is particularly useful for users looking to automate and simplify their Python project setup with Rye.

**Why Rye?** I used to use Anaconda to set up an environment, then I wrote my own bash script to set up the environment with pip. But this is by far the fastest and universally easiest way to set up a Python environment.

For complete documentation on using Rye, see [Rye Documentation](https://rye-up.com/guide/).

## Features

*   **Initialize New Rye Project**: Set up a new project in the current or a new directory.
*   **Sync Project**: Synchronize the project's dependencies and environment.
*   **Add Dependency**: Interactively add one or more dependencies to your project.
*   **Commit Files to Git**: Automatically detect and commit untracked files.
*   **Show Project Details**: Display information about the project's environment, Python version, and installed dependencies.

## Prerequisites

*   Bash Shell: Ensure you have Bash installed on your system.
*   Git: Required for the commit functionality.
*   Rye: The script assumes Rye is installed and accessible in the system's PATH. See [Installation - Rye](https://rye-up.com/guide/installation/) for details.

## Usage

1.  **Download the Script**: Save `run_rye.sh` to your local machine and grant it execute permissions:

    `chmod +x run_rye.sh`

2.  **Running the Script**: Execute the script in your terminal:

    `./run_rye.sh`

3.  **Follow the Prompts**: The script will guide you through various options:

    **1) Initialize a new Rye project**: Create a new project in a specified directory.
    **2) Sync project**: Synchronize your project's environment and dependencies.
    **3) Add a dependency**: Add dependencies to your project interactively.
    **4) Commit files to Git**: Detect and commit untracked files in your project directory.
    **5) Exit**: Display project details and exit the script.

## Detailed Functionality

**commit\_untracked\_files**: Detects untracked files in the project's Git repository and commits them with a custom or default message.
**clear\_console**: Clears the terminal screen for a clean user interface.
**choose\_installation\_directory**: Allows users to select the current directory or a new directory for project initialization.
**init\_project**: Initializes a new project using Rye in the chosen directory.
**sync\_project**: Synchronizes the project, ensuring all dependencies are correctly installed.
**add\_dependency**: Adds specified dependencies to the project and syncs the environment.
**show\_project\_details**: Provides detailed information about the project's virtual environment, Python version, and installed dependencies.

## Notes

*   The script assumes it's being run within a Git repository for the commit functionality.
*   It's recommended to run this script at the root of your project directory.
*   Ensure Rye is correctly installed and configured on your system before using this script.

## Troubleshooting

*   If you encounter permission issues, ensure `run_rye.sh` is executable.
*   For problems related to Rye commands, refer to the [official Rye documentation](https://rye-up.com/guide/) or the [FAQ section](https://rye-up.com/guide/faq/).

## Contributing

Feedback and contributions to the script are welcome. Please adhere to standard Bash scripting conventions and document any changes or improvements you propose.
