# ---------- base ----------
FROM node:18-alpine

# Install n8n + OpenAI community node package
RUN npm install -g n8n@1.44.0 \
    && npm install -g n8n-nodes-openai@latest         \
    && npm cache clean --force

# n8n data directory
WORKDIR /data

# (optional) ship your workflow JSON inside the image
COPY n8n_voice_reservation_final_mvp.json /data/

# Recommended runtime env-vars
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678
CMD ["n8n"]