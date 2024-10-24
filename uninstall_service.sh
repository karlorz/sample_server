#!/bin/bash

# Define variables
SERVICE_NAME="sample_server.service"
SERVICE_PATH="/etc/systemd/system/"
PYTHON_SCRIPT="sample_server.py"
DESTINATION_PATH="/app/"

# Stop the service if it's running
echo "Stopping the service"
sudo systemctl stop $SERVICE_NAME

# Disable the service to prevent it from starting on boot
echo "Disabling the service"
sudo systemctl disable $SERVICE_NAME

# Remove the service file from the systemd directory
echo "Removing service file from $SERVICE_PATH"
sudo rm -f ${SERVICE_PATH}${SERVICE_NAME}

# Remove the Python script from the destination directory
echo "Removing Python script from $DESTINATION_PATH"
sudo rm -f ${DESTINATION_PATH}${PYTHON_SCRIPT}

# Reload systemd to apply the changes
echo "Reloading systemd daemon"
sudo systemctl daemon-reload

sleep 1

# Check the status of the service to ensure it is removed
echo "Checking the status of the service"
sudo systemctl status $SERVICE_NAME