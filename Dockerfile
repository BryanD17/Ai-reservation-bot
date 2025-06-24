# Use a Node base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Expose the port your app uses
EXPOSE 5678

# Start your app
CMD ["npm", "start"]
