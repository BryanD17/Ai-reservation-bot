# ---------- minimal, reliable n8n container ----------
FROM n8nio/n8n:1.44.0

# Directory where n8n stores its SQLite DB / credentials
WORKDIR /data

# (Optional) bundle your workflow JSON
COPY n8n_voice_reservation_final_mvp.json /data/

# Good-practice runtime envs
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678
CMD ["n8n"]