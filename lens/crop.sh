#!/bin/bash

# Function to crop "iphone.jpeg"
crop_iphone() {
    local image_name="iphone.jpeg"
    local crop_size="850x850"

    echo "Cropping $image_name..."
    mogrify -path crop -gravity center -crop ${crop_size}+-240+-60 +repage "$image_name"
    echo "Cropped $image_name with size ${crop_size} and saved as crop/$image_name"
}

# Function to crop "dslr.jpeg"
crop_dslr() {
    local image_name="dslr.jpeg"
    local crop_size="1000x1000"

    echo "Cropping $image_name..."
    mogrify -path crop -gravity center -crop ${crop_size}+200+50 +repage "$image_name"
    echo "Cropped $image_name with size ${crop_size} and saved as crop/$image_name"
}

# Check if ImageMagick is installed
if ! command -v mogrify &> /dev/null; then
    echo "ImageMagick is not installed. Please install ImageMagick before running this script."
    exit 1
fi

# Check if the "crop" directory exists, or create it
if [ ! -d "crop" ]; then
    mkdir crop
fi

# Check if the required images exist and crop them
if [ -f "iphone.jpeg" ]; then
    crop_iphone
else
    echo "Error: iphone.jpeg not found in the current directory."
fi

if [ -f "dslr.jpeg" ]; then
    crop_dslr
else
    echo "Error: dslr.jpeg not found in the current directory."
fi
