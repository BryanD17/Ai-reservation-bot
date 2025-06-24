FROM n8nio/n8n:latest

WORKDIR /home/node

# Remove this line if .env file isn't present (let Railway handle env vars)
# COPY .env .env

CMD ["n8n"]
