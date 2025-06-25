# ---------- lightweight, reliable n8n image ----------
FROM node:18-alpine

# Add dumb-init for proper signal handling
RUN apk add --no-cache dumb-init

# Install n8n (includes OpenAI nodes)
RUN npm install -g n8n@1.44.0 \
    && npm cache clean --force

# Directory where n8n stores its SQLite DB / credentials
WORKDIR /data          # <-- DO NOT copy workflow here (volume may shadow it)

# ------------------------------------------------------------------
# Copy the workflow JSON into a separate path that is *not* volume-mounted
# ------------------------------------------------------------------
COPY voice_reservation_full_mvp2025_v4.json /workflows/

# ------------------------------------------------------------------
# n8n boot-time import settings
# ------------------------------------------------------------------
# Import this workflow on every container start
ENV N8N_IMPORT_FILE=/workflows/voice_reservation_full_mvp2025_v4.json
# Execute the import immediately at boot
ENV N8N_IMPORT_EXPORT_EXECUTE=true
# Do NOT overwrite existing versions in /data (keeps manual edits)
ENV N8N_IMPORT_OVERWRITE=false

# Recommended runtime envs
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678

ENTRYPOINT ["dumb-init","--"]
CMD ["n8n"]
