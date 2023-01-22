#!/bin/bash

# Start the mobile app container
docker start traffic-congestion-mobile-app

# Schedule the container to stop after 8 hours
(sleep 28800; docker stop traffic-congestion-mobile-app) &
