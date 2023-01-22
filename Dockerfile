# Use an official Python runtime as the base image
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the source code
COPY . .

# Expose the port for the app
EXPOSE 8000

# Define the command to run the app
CMD ["python", "web-app.py"]

# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the source code
COPY . .

# Expose the port for the app
EXPOSE 3000

# Define the command to run the app
CMD ["npm", "start"]
