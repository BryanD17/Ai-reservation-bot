# Use official n8n image
FROM n8nio/n8n

# Optional: working directory (used internally by n8n)
WORKDIR /home/node

# Optional: You can copy your workflow JSON only (not full repo)
COPY n8n_voice_reservation_final_mvp.json /home/node/

# Set this to prevent permission issues in future
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Default port n8n runs on
EXPOSE 5678

# Start n8n automatically
CMD ["n8n"]
