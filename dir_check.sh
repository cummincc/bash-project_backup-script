#!/bin/bash

# Function to show how to use the script
usage() {
    echo "Usage: $0 -d directory -l size_limit"
    echo "  -d  Specify the directory to check"
    echo "  -l  Specify the size limit in MB (must be a positive integer)"
    echo "  -h  Show help"
}

# Get options from the user
while getopts ":d:l:h" opt; do
    case ${opt} in
        d)
            DIRECTORY="$OPTARG"
            ;;
        l)
            LIMIT="$OPTARG"
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            exit 1
            ;;
    esac
done

# Check if both directory and limit are provided
if [ -z "$DIRECTORY" ] || [ -z "$LIMIT" ]; then
    echo "Error: You must specify both the directory (-d) and size limit (-l)."
    usage
    exit 1
fi

# Validate that the limit is a positive integer
if ! [[ "$LIMIT" =~ ^[0-9]+$ ]]; then
    echo "Error: Size limit must be a positive integer."
    usage
    exit 1
fi

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: The directory '$DIRECTORY' does not exist."
    exit 1
fi

# Calculate directory size in MB
DIR_SIZE=$(du -sm "$DIRECTORY" | cut -f1)

# Compare the directory size to the limit
if [ "$DIR_SIZE" -gt "$LIMIT" ]; then
    echo "Warning: The directory '$DIRECTORY' is $DIR_SIZE MB, which exceeds the limit of $LIMIT MB."
else
    echo "The directory '$DIRECTORY' is within the limit at $DIR_SIZE MB."
fi