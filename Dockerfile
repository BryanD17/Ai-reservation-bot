FROM n8nio/n8n:latest

# Optional: Set working directory
WORKDIR /home/node

# Optional: Copy in your workflow JSON
COPY n8n_voice_reservation_final_mvp.json /home/node/

# Optional: Set env to fix config permissions warning
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expose the n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
