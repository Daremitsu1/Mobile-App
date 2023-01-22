#!/bin/bash

# Start the mobile app container
docker run -d -p 3000:3000 --name traffic-congestion-mobile-app myimage 
