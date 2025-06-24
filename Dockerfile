FROM node:18-alpine

# Git + OpenSSH needed for github:<repo> syntax
RUN apk add --no-cache git openssh

# Install n8n and OpenAI nodes
RUN npm install -g n8n@1.44.0 \
    && npm install -g github:n8n-io/n8n-nodes-openai \
    && npm cache clean --force

WORKDIR /data
COPY n8n_voice_reservation_final_mvp.json /data/
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
EXPOSE 5678
CMD ["n8n"]