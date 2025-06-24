# ---------- base ----------
FROM node:18-alpine

# Install n8n at the exact version you want
RUN npm install -g n8n@1.44.0

# Where n8n stores its SQLite DB / credentials
WORKDIR /data

# (Optional) copy your workflow JSON into the container
COPY n8n_voice_reservation_final_mvp.json /data/

# Good practice: enforce secure credentials file perms
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

# Expose the port n8n serves on
EXPOSE 5678

# Start n8n
CMD ["n8n"]