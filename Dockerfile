# ---------- base ----------
FROM node:18-alpine

# Install n8n and the OpenAI community nodes
RUN npm install -g n8n@1.44.0 \
    && npm install -g @n8n/nodes-openai@latest

# Directory where n8n stores its SQLite DB / credentials
WORKDIR /data

# (Optional) bundle your workflow JSON inside the image
COPY n8n_voice_reservation_final_mvp.json /data/

# Enforce secure credentials-file permissions & set timezone
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

# Port n8n serves on (Railway maps this automatically)
EXPOSE 5678

# Start n8n
CMD ["n8n"]