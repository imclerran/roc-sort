#!/bin/zsh

roc build --optimize --output=benchmark > /dev/null 2>&1

# increase the stack limit to 32MB
old_limit=$(ulimit -s)
ulimit -s 32768

# Array of arguments
args=("1k" "10k" "100k")

# Loop through each argument and run the benchmark program
for arg in "${args[@]}"; do
    ./benchmark "$arg"
done

# Reset the stack limit
ulimit -s $old_limit 