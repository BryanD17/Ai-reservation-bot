# Use the official n8n image
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy everything into the container
COPY . .

# Ensure correct permissions (especially for the .n8n config folder)
RUN chown -R node:node /home/node

# Use the default startup command (n8n)
CMD ["n8n"]
