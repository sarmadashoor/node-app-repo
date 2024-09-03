# Use the official Node.js image as a base
FROM node:14

# Set the working directory in the container
WORKDIR /node

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . /node/

# Make wait-for-it.sh executable
RUN chmod +x /node/wait-for-it.sh

# Expose port 3001
EXPOSE 3001

# Run the wait-for-it.sh script and then start the Node.js application
CMD ["./wait-for-it.sh", "mongo:27017", "--", "npm", "start"]

