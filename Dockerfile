# Use an official Node.js and python runtime as the base image
FROM node:14-alpine as react-build
FROM python:3.8-alpine

# Create a working directory for the react app
WORKDIR /app/client

# Copy the package.json and package-lock.json
COPY client/package*.json ./

# Install the react dependencies
RUN npm install

# Copy the react source code
COPY client/. .

# Build the react app
RUN npm run build

# Create a working directory for the python app
WORKDIR /app/server

# Copy the requirements file
COPY server/requirements.txt .

# Install the python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the python source code
COPY server/. .

# Expose the port for the app
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "start"]
