#!/bin/bash

# Path to csv file
CSV_FILE="jokesforjokegenerator.csv"

# Count the number of lines (jokes) in the CSV
count_lines() {
    local line_count=$(wc -l < "$1")
    echo "$line_count"
}

# Get a random number within the specified range
get_random_number() {
    local min=$1
    local max=$2
    echo $(( RANDOM % (max - min + 1) + min ))
}

# Fetch a random joke from the CSV file
fetch_random_joke() {
    local csv_file="$1"
    local total_lines=$(count_lines "$csv_file")
    local random_line_number=$(get_random_number 1 "$total_lines")

    # Get the joke from the csv
    local joke=$(sed -n "${random_line_number}p" "$csv_file" | cut -d ',' -f 1 | tr -d '"')
    echo "$joke"
}

# The main script
echo "Here's a random joke for you:"
joke=$(fetch_random_joke "$CSV_FILE")
echo "$joke"
