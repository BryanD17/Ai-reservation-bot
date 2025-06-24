# Use official n8n image
FROM n8nio/n8n

# Optional: Copy your workflow file into the container (can also import via UI)
COPY n8n_voice_reservation_final_mvp.json /data/workflows/

# Set the working directory
WORKDIR /data

# Expose n8n's default port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
