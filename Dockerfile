# ---------- lightweight, reliable n8n image ----------
FROM node:18-alpine

# Add dumb-init for proper signal handling
RUN apk add --no-cache dumb-init

# Install n8n globally (includes OpenAI nodes)
RUN npm install -g n8n@1.44.0 \
    && npm cache clean --force

# Directory where n8n stores its SQLite DB / credentials
WORKDIR /data

# (Optional) bundle your latest workflow JSON
COPY n8n_voice_reservation_final_mvp.json /data/

# Recommended runtime envs
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678

ENTRYPOINT ["dumb-init","--"]
CMD ["n8n"]