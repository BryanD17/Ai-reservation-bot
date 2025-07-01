# Voice-to-Table – AI Reservation Assistant for Small Restaurants
*(Built with Twilio, n8n Cloud, OpenAI Whisper + GPT-4o, and Supabase)*

---

## 🌮 What problem does it solve?
Small restaurants miss bookings because nobody can answer the phone 24 × 7.  
Voice-to-Table answers every call, understands the guest’s spoken request, checks table availability, and texts back a confirmation code—all hands-free for staff.

---

## 🏗️ How it works (human-friendly overview)

Guest calls ➜ Twilio greets & records voice
➜ n8n downloads audio
➜ OpenAI Whisper turns speech into text
➜ GPT-4o pulls out name, date, time, party size
➜ n8n checks table availability
➜ n8n saves booking to Supabase, makes a 4-digit code
➜ Twilio SMS sends confirmation to the caller


---

## 🔧 Building blocks explained in plain language

| Piece | What it is | Why we use it |
|-------|------------|---------------|
| **Twilio Phone Number** | Cloud phone line | Answers calls, records them, sends SMS |
| **TwiML Bin** | Tiny XML script | Says greeting, starts recording, thanks caller, hangs up |
| **n8n Cloud** | Drag-and-drop automation | Orchestrates the whole workflow—no servers to manage |
| **Webhook node** | Listening URL | Receives Twilio’s callback with recording link |
| **Download Recording node** | File grabber | Pulls the guest’s voice file |
| **OpenAI Whisper node** | Speech-to-text AI | Converts voice to plain text |
| **OpenAI GPT-4o node** | Language AI | Extracts the booking details from that text |
| **HTTP Request node** | Simple API call | Fetches caller’s phone # from Twilio |
| **Merge node** | Combiner | Joins the AI output with the phone number |
| **Supabase (Postgres)** | Hosted database | Stores each reservation row forever |
| **Twilio SMS node** | Text sender | Delivers confirmation or alternate time |

---

## 📂 Repository contents

| File / Folder | What it is |
|---------------|------------|
| `Dockerfile` | Lightweight image to self-host n8n + workflow (Railway, Render, etc.) |
| `voice_reservation_full_mvp2025_v4.json` | The n8n workflow you import into n8n Cloud |
| `twiml/Reservation-Flow.xml` | One-file TwiML: greet → record → thank + hangup |
| `supabase/reservations.sql` | SQL to create the `reservations` table |
| `README.md` | ← this file |

---

## 🚀 Call flow in detail

1. Guest dials the restaurant’s Twilio number.  
2. **TwiML** greets, records their spoken request, then hangs up.  
3. Twilio posts the recording link + call SID to the **n8n Webhook**.  
4. **Download Recording** gets the audio; **Whisper** transcribes it.  
5. **GPT-4o** returns `{ name:"Brian", party:4, date:"2025-07-08", time:"19:00" }`.  
6. **HTTP Request** asks Twilio “Who called this call SID?” → `"from":"+17736558730"`.  
7. **Merge** combines transcript + phone number.  
8. n8n generates a 4-digit confirmation code and (in demo) marks slot available.  
9. **Supabase** inserts the row.  
10. **Twilio SMS** sends:  
    “Brian, your table for 4 on Jul 8 at 7 PM is confirmed. Code 5938. Reply STOP to cancel texts.”  
11. Workflow responds `<Hangup/>` to Twilio—call already ended politely.

---

## 🎯 Ideal client

| Ideal customer | Why they care |
|----------------|--------------|
| **Independent restaurant / small chain** | No dedicated host to answer phones |
| **Takes voice bookings** | Automation replaces missed calls |
| **Average ticket \$25+** | One saved table pays the monthly fee |
| **Uses OpenTable or Google Calendar** | Integrates with their existing system |

---

## 📈 Roadmap

* ✅ Demo/mock mode (auto-approve every booking)  
* 🔜 Live OpenTable + Google Calendar fallback  
* 🔜 Voice-driven cancellation (“cancel code 5938”)  
* 🔜 Owner dashboard (Supabase + React)  
* 🔜 Multi-language Polly voices

---

## 🤝 Contributing
Open issues or PRs welcome. Ping **@your-github-handle** for questions.

---

## 📝 License
Code in this repo is MIT. n8n workflow files are under the n8n Fair Code license—see `LICENSE`.
