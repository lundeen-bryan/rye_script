#!/bin/bash

# Function to check and commit untracked files
commit_untracked_files() {
    # Check the status of the git repository and grep for untracked files
    if git status | grep -q 'Untracked files:'; then
        echo "Untracked files found. Adding all files and committing..."

        # Add all untracked files to staging
        git add .

        # Commit the changes with a default message or allow for a custom message
        local commit_message=${1:-"initial commit"}
        git commit -m "$commit_message"

        echo "Files committed with message: '$commit_message'"
    else
        echo "No untracked files to commit."
    fi
}

# Function to clear the console/terminal screen
clear_console() {
	# Clear the screen
	clear
}

# Function to ask user for installation directory
choose_installation_directory() {
  while true; do
    # Present the options to the user
    echo "Select the installation directory:"
    echo "1) Current directory"
    echo "2) New directory"
    read -r directory_choice

    case $directory_choice in
      1)
        # Use the current directory
        echo "Installing project in the current directory: $(pwd)"
        break  # Exit the loop after a valid selection
        ;;
      2)
        # Prompt for a new directory path
        echo "Please enter the directory where you want to install the project:"
        read -r user_input
        if [[ -d $user_input ]] && [[ -w $user_input ]]; then
          echo "Installing project in: $user_input"
          cd "$user_input" || exit  # Change to the directory or exit if it fails
          break  # Exit the loop after a valid selection
        else
          echo "Invalid or non-writable path. Please try again."
          # The loop will continue, allowing the user to try again
        fi
        ;;
      *)
        echo "Invalid choice. Please select 1 or 2."
        # The loop will continue, prompting the user again
        ;;
    esac
  done
}

# Function to initialize a new Rye project
init_project() {
    choose_installation_directory  # Ask user for installation directory before initializing
    echo "Enter the name of the project:"
    read project_name
    rye init "$project_name"
    cd "$project_name" || exit
    echo "Project $project_name initialized."
}

# Function to sync the project
sync_project() {
    rye sync
    echo "Project synced."
}

# Function to add a dependency
add_dependency() {
    while true; do
        echo "Enter the dependency to add (e.g., flask>=2.0):"
        read dependency
        if [[ -z $dependency ]]; then
            echo "No input entered. Exiting add dependency mode."
            break
        fi
        rye add "$dependency"
        rye sync
        echo "Dependency $dependency added and project synced."

        # Ask if the user wants to add more dependencies
        echo "Do you want to add another dependency? (yes/no)"
        read answer
        if [[ $answer != "yes" ]]; then
            break
        fi
    done
}

# Function to show project details
show_project_details() {
	  clear_console
    # Assuming the script is run within the project directory
    local venv_path=".venv"
    echo "Project Details:"

    # 1. Path to the Virtual Environment
    if [[ -d "$venv_path" ]]; then
        echo "Virtual Environment Path: $(pwd)/$venv_path"
    else
        echo "Virtual Environment not found. Have you run 'rye sync'?"
    fi

    # 2. Version of Python Installed
    # Using the Python from the virtual environment
    if [[ -d "$venv_path" ]]; then
        echo "Python Version:"
        "$venv_path/Scripts/python" --version
    else
        echo "Python version not available. Virtual Environment not found."
    fi

    # 3. Dependencies Installed
    # Listing dependencies from the lock file or using Rye's mechanisms
    if [[ -f "requirements.lock" ]]; then
        echo "Dependencies installed (from requirements.lock):"
        cat "requirements.lock"
    else
        echo "Dependencies list not available. Have you run 'rye sync'?"
    fi
}

# Main menu for the script
clear_console
while true; do
    echo "Select an option:"
    echo "1) Initialize a new Rye project"
    echo "2) Sync project"
    echo "3) Add a dependency"
    echo "4) Commit files to Git"
    echo "5) Exit"
    read -r option

    case $option in
        1) init_project ;;
        2) sync_project ;;
        3) add_dependency ;;
        4) commit_untracked_files ;;
        5)
            show_project_details  # Call show_project_details before exiting
            break ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

echo "Script ended."
