# Use the official n8n image
FROM n8nio/n8n:latest

# Set the working directory
WORKDIR /data

# Copy your local files (including .env if needed)
COPY . .

# Expose port 5678 (default for n8n)
EXPOSE 5678

# Start n8n
CMD ["n8n"]
