# ---------- base ----------
FROM node:18-alpine

# Add git (required for npm install github:<repo>)
RUN apk add --no-cache git

# Install n8n + OpenAI community nodes from GitHub
RUN npm install -g n8n@1.44.0 \
    && npm install -g github:n8n-io/n8n-nodes-openai \
    && npm cache clean --force

# n8n data directory
WORKDIR /data

# Optional: ship your workflow JSON
COPY n8n_voice_reservation_final_mvp.json /data/

# Good practice envs
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678
CMD ["n8n"]
