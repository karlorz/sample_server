#!/bin/bash

# Define variables
SERVICE_FILE="sample_server.service"
SERVICE_PATH="/etc/systemd/system/"
PYTHON_SCRIPT="sample_server.py"
DESTINATION_PATH="/app/"

# Create the destination directory if it doesn't exist
if [ ! -d "$DESTINATION_PATH" ]; then
  echo "Creating destination directory $DESTINATION_PATH"
  sudo mkdir -p $DESTINATION_PATH
else
  echo "Destination directory $DESTINATION_PATH already exists"
fi

# Stop the service if it's already running
echo "Stopping the service"
sudo systemctl stop sample_server.service

# Copy the service file to the systemd directory, force overwrite
echo "Copying service file to $SERVICE_PATH"
sudo cp -f $SERVICE_FILE $SERVICE_PATH

# Copy the Python script to the destination directory, force overwrite
echo "Copying Python script to $DESTINATION_PATH"
sudo cp -f $PYTHON_SCRIPT $DESTINATION_PATH

# Reload systemd to recognize the new service
echo "Reloading systemd daemon"
sudo systemctl daemon-reload

# Enable the service to start on boot
echo "Enabling the service"
sudo systemctl enable sample_server.service

# Start the service
echo "Starting the service"
sudo systemctl start sample_server.service

sleep 1

# Check the status of the service
echo "Checking the status of the service"
sudo systemctl status sample_server.service