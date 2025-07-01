# Voice-to-Table — AI Reservation Assistant for Small Restaurants  
(Built with Twilio, n8n Cloud, OpenAI Whisper + GPT-4o, and Supabase)

---

## Overview

Voice-to-Table turns any restaurant phone line into a 24-hour reservation desk.  
When a guest calls, the system records the request, extracts the booking details with speech-to-text and language models, checks table availability, stores the reservation, and sends the guest a confirmation SMS—all without staff involvement.

---

## High-Level Workflow

Guest call → Twilio greets and records voice
Recording link → n8n downloads audio
Audio → OpenAI Whisper transcribes speech
Text → GPT-4o extracts name, date, time, party size
Details → n8n checks availability (OpenTable/Google Calendar)
Booking row → Supabase stores reservation and confirmation code
SMS → Twilio sends confirmation to the caller



---

## Key Components

| Component | Purpose | Notes |
|-----------|---------|-------|
| **Twilio Phone Number** | Receives calls and sends SMS | One number per restaurant |
| **TwiML Bin** | Plays greeting, records caller, ends call | XML hosted in Twilio |
| **n8n Cloud** | Orchestrates the workflow | No server maintenance required |
| **Download Recording** | Retrieves the audio file | Provides data for transcription |
| **OpenAI Whisper** | Speech-to-text | Converts caller audio to text |
| **OpenAI GPT-4o** | Natural-language parsing | Extracts structured booking data |
| **HTTP Request (Twilio API)** | Retrieves caller phone number | Uses Call SID |
| **Merge (by position)** | Combines AI output and phone number | Ensures one item with all data |
| **Supabase (Postgres)** | Stores reservations | Reliable, hosted database |
| **Twilio SMS** | Sends confirmation or alternative time | Uses A2P-compliant templates |

---

## Repository Structure

| Path | Description |
|------|-------------|
| `Dockerfile` | Minimal Node 18-alpine image for optional self-hosting |
| `voice_reservation_full_mvp2025_v4.json` | n8n workflow file |
| `twiml/Reservation-Flow.xml` | Single-file TwiML (greet → record → thank → hang up) |
| `supabase/reservations.sql` | SQL schema for the `reservations` table |
| `README.md` | Project documentation |

---

## Detailed Call Flow

1. Guest dials the Twilio number.  
2. TwiML Bin greets the caller, records up to 40 seconds, then hangs up.  
3. Twilio posts the recording URL and Call SID to the n8n webhook.  
4. n8n downloads the recording; Whisper transcribes the audio.  
5. GPT-4o converts the transcript into JSON containing name, party size, date, and time.  
6. n8n calls Twilio’s REST API to obtain the caller’s phone number (`from`).  
7. A Merge node combines booking data and phone number.  
8. n8n generates a four-digit confirmation code and checks availability (mock, OpenTable, or Google Calendar).  
9. The reservation is inserted into Supabase with status `confirmed`.  
10. Twilio sends an SMS:  
   “Joe’s Bistro: table for 4 on 8 July at 7 PM confirmed. Code 5938. Reply STOP to cancel texts.”  
11. The workflow responds with `<Hangup/>`; the caller hears a closing message and the call ends.

---

## Target Client Profile

| Attribute | Benefit |
|-----------|---------|
| Independently owned restaurant or small chain | Removes need for a full-time host |
| Relies on phone bookings | Captures calls outside business hours |
| Average check value above \$25 | One saved booking justifies subscription |
| Already uses OpenTable or Google Calendar | Integrates without new hardware |

---

## Roadmap

* Live availability via OpenTable API, with Google Calendar fallback  
* Voice-driven cancellation by confirmation code  
* Owner dashboard (Supabase + React)  
* Optional multilingual voice prompts (Amazon Polly)  

---

## Contributing

Pull requests and issue reports are welcome.  
Contact **[your-GitHub-handle]** for questions.

---

## License

* Repository source code: MIT  
* n8n workflow files: n8n Fair Code license (see `LICENSE`)

