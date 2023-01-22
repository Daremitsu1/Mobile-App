#!/bin/bash

# Start the web app container
docker run -d -p 3000:3000 -p 8000:8000 --name traffic-congestion-app myimage

# Schedule the container to stop after 8 hours
(sleep 28800; docker stop traffic-congestion-web-app) &
