#!/bin/bash

# Start the web app container
docker start traffic-congestion-web-app

# Schedule the container to stop after 8 hours
(sleep 28800; docker stop traffic-congestion-web-app) &
