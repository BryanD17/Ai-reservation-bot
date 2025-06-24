FROM n8nio/n8n:latest
WORKDIR /home/node
COPY n8n_voice_reservation_final_mvp.json /home/node/
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
EXPOSE 5678
CMD ["n8n"]