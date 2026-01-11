#!/bin/bash

# Define the directory to list
TARGET_DIR="./my_directory"

# Create a sample directory and files for demonstration
mkdir -p "$TARGET_DIR"
touch "$TARGET_DIR/file_A.txt"
touch "$TARGET_DIR/document_B.pdf"
touch "$TARGET_DIR/image_C.jpg"
touch "$TARGET_DIR/archive_D.zip"

echo "Listing contents of $TARGET_DIR and generating case statement:"

# Use 'select' to create an interactive menu from the directory contents
select ITEM in "$TARGET_DIR"/* "Exit"; do
    case "$ITEM" in
        "$TARGET_DIR/file_A.txt")
            echo "You selected file_A.txt. Performing action for text file."
            # Add specific actions for file_A.txt here
            ;;
        "$TARGET_DIR/document_B.pdf")
            echo "You selected document_B.pdf. Performing action for PDF document."
            # Add specific actions for document_B.pdf here
            ;;
        "$TARGET_DIR/image_C.jpg")
            echo "You selected image_C.jpg. Performing action for image file."
            # Add specific actions for image_C.jpg here
            ;;
        "$TARGET_DIR/archive_D.zip")
            echo "You selected archive_D.zip. Performing action for archive."
            # Add specific actions for archive_D.zip here
            ;;
        "Exit")
            echo "Exiting the script."
            break
            ;;
        *)
            echo "Invalid selection. Please choose a valid option."
            ;;
    esac
done

# Clean up sample directory and files
rm -rf "$TARGET_DIR"
