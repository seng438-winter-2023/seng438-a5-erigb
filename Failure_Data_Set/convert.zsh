#!/bin/bash
#Usage: 
# sudo chmod +x convert.zsh
#./convert.zsh path/to/source/ output/path/

# Set input and output directories
input_dir=$1
output_dir=$2

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through all .DAT files in input directory
echo -e "\033[1m$output_dir:\033[0m"
for file in "$input_dir"/*.DAT; do
    # Get filename without extension
    filename=$(basename "$file" .DAT)
    # Convert file to .csv and save in output directory with same filename
    awk -F'\t' 'BEGIN{OFS=","} {for (i=1; i<=NF; i++) {printf "%s%s", $i, (i==NF ? ORS : OFS)}}' "$file" > "$output_dir/${filename}.csv"
    # Echo filename of created file
    echo "${filename}.csv"
done