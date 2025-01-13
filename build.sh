#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define paths
DIST_DIR="dist"
SRC_DIR="src"
ICONS_DIR="icons"
BUILD_ZIP="jira-rtl.zip"

# Clean up previous builds
echo "Cleaning up old build artifacts..."
rm -rf "$DIST_DIR" "$BUILD_ZIP"

# Create dist directory
echo "Creating dist directory..."
mkdir -p "$DIST_DIR"

# Copy essential files
echo "Copying files to dist directory..."
cp manifest.json "$DIST_DIR/"
cp -r "$ICONS_DIR" "$DIST_DIR/"
cp -r "$SRC_DIR" "$DIST_DIR/"

# Create the zip file
echo "Creating zip file..."
cd "$DIST_DIR"
zip -r "../$BUILD_ZIP" ./*
cd ..

# Build complete
echo "Build complete: $BUILD_ZIP"