#!/bin/bash # Tells the system to run this script using Bash.

current_date=$(date) # Runs the date command and stores the current date and time in a variable.
host_name=$(hostname) # Runs the hostname command and stores the computer name in a variable.
user_name="$USER" # Stores the current username in the user_name variable.

echo "Current date: $current_date" # Prints the current date and time.
echo "Hostname: $host_name" # Prints the computer hostname.
echo "Username: $user_name" # Prints the current username.

echo "Disk usage:" # Prints a heading for the disk usage information.
df -h # Displays disk usage in a human-readable format.

echo "Running processes:" # Prints a heading for the running process information.
ps aux # Displays all running processes for all users.

read -p "Enter directory name: " directory_name # Prompts the user and stores the directory name.
read -p "Enter process file name: " process_file_name # Prompts the user and stores the file name.

mkdir -p "$directory_name" # Creates the directory; -p also creates missing parent directories.

process_file="$directory_name/$process_file_name" # Combines the directory and file names into one file path.
touch "$process_file" # Creates an empty file at the specified path.

ps aux > "$process_file" # Stores the running process information in the file using output redirection.

echo "Process information saved to: $process_file" # Confirms where the process information was saved.