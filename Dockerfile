# use the latest stable v1 image (as of June-2025)
FROM n8nio/n8n:1.44.0
WORKDIR /home/node
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
EXPOSE 5678
CMD ["n8n"]
