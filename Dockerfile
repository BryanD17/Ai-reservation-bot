# Use the official n8n image
FROM n8nio/n8n:latest

# Optional: Set working directory
WORKDIR /home/node

# Use Railway ENV variables directly inside container
ENV GENERIC_TIMEZONE="America/Chicago"

# Expose the default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]