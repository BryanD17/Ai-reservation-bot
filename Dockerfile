# Use the official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy everything into the container
COPY . .

# Use the default startup command
CMD ["n8n"]
