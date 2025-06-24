# Use official n8n image
FROM n8nio/n8n

# Optional: Set working directory (but don't override important dirs)
WORKDIR /data

# Optional: Copy workflow JSON if needed
COPY n8n_voice_reservation_final_mvp.json /data/

# Optional: Set environment permissions enforcement
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose default n8n port
EXPOSE 5678

# Use default startup command
CMD ["n8n"]
