# bash-project_directory_size_checker

# Directory Size Checker

## Purpose
The **Directory Size Checker** script is a simple and effective tool designed to help users monitor the size of specific directories on their system. This script checks the total size of a given directory and warns the user if it exceeds a specified limit. It is useful for managing disk space, especially when working with directories that can grow large, such as backups, media files, or project folders.

## Features
- Checks the total size of a specified directory.
- Compares the directory size against a user-defined limit.
- Provides warnings when the directory size exceeds the limit.

## Usage
To use the script, run the following command in your terminal:

```bash
./dir_check.sh -d /path/to/directory -l size_limit

## Note
- -d : Specify the directory you want to check.
- -l : Set the size limit in MB.