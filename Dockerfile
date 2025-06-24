FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Only copy necessary files (avoid overwriting internal n8n files)
COPY .env .env

# You can copy workflows, credentials, and other n8n config if needed
# COPY ./workflows ./workflows
# COPY ./credentials ./credentials

# Let the container run n8n as its entrypoint
CMD ["n8n"]
