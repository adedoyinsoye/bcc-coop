#!/bin/bash

# Print the current date and time
echo "Build started at: $(date)"

# Print the user running the script
echo "Running as user: $(whoami)"

# List all files in the current directory (including hidden files)
echo "Listing files in the workspace:"
ls -la

# Add custom commands for your build process
# Example: Run tests (if applicable)
if [ -f "phpunit.xml.dist" ]; then
    echo "Running PHPUnit tests..."
    vendor/bin/phpunit --configuration phpunit.xml.dist
else
    echo "No test configuration found. Skipping tests."
fi

# Example: Build or compile if needed
if [ -f "Makefile" ]; then
    echo "Running Makefile..."
    make
else
    echo "No Makefile found. Skipping build step."
fi

# Indicate the script has completed
echo "Build script completed successfully."
