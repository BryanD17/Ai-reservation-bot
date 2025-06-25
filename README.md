# Ai-reservation-bot

Voice Reservation MVP – Breakdown
MVP Voice Reservation Flow (2025)
1. Caller dials restaurant’s Twilio number.
2. Twilio plays greeting, records the caller’s reservation request, and POSTs RecordingUrl to n8n
webhook /voice-reservation.
n8n workflow

• Webhook receives POST.
• HTTP Request — downloads the audio file.
• OpenAI “Transcribe a recording” (Whisper.1) → raw text.
• OpenAI “Message a model” (GPT.4o) — extracts name, party, date, time → JSON fields.
• Generate 4.digit confirmation code.
• HTTP Request — Check OpenTable API for availability.
If available:
– Insert reservation row in Supabase (name, party, date, time, code).
If not:
– GPT- 4o suggests alternate time JSON {suggested_time}.
• Twilio Send SMS:
– If confirmed: “Your reservation is confirmed. Code 8124.”
– If alternate: “Slot full, can offer 18:30. Reply YES to confirm.”
• Respond 200 JSON to the original webhook.
Supabase table schema
---------------------
CREATE TABLE reservations (
id SERIAL PRIMARY KEY,
name TEXT,
party INT,
date DATE,
time TIME,
code TEXT,
created_at TIMESTAMPTZ DEFAULT now()
);
Environment
-----------
Railway container with /data volume or auto.import.
WEBHOOK_URL env.var set to public https://.up.railway.app
OpenAI, Twilio, Supabase credentials via env.vars.

