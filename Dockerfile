FROM n8nio/n8n:1.44.0

WORKDIR /data
COPY n8n_voice_reservation_final_mvp.json /data/

ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV GENERIC_TIMEZONE=America/Chicago

EXPOSE 5678
CMD ["n8n"]