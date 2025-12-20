# I-Ching Consultation App (Flutter)

A Flutter-based I-Ching consultation app designed for professional consultants who perform **manual divination** and require a clean, repeatable way to **capture interpretations, manage multiple questions per session, and generate client-ready PDF reports**.

The app does **not** automate divination or interpretation.  
All interpretive content is entered manually by the consultant.

---

## Overview

The app follows a **session-based workflow**:

1. Enter client personal details  
2. Start a consultation session  
3. Enter a question and category (system date/time captured automatically)  
4. Manually input six coin throw results:
   - yin  
   - yang  
   - yin changing  
   - yang changing  
5. Generate the resulting hexagram(s)  
6. View hexagram titles and structural descriptions  
7. **Enter the consultant’s interpretation manually**  
8. Choose one of:
   - **Save and ask another question** (loop continues with a new timestamp)
   - **Generate report** (end session)
9. Review the compiled report  
10. Export or share the report as a PDF (A5 format)

A single session can contain **multiple questions**, each with its own timestamp, category, hexagram(s), and interpretation.

---

## Key Features

- Fully offline Flutter application  
- Manual input of coin throw results (no automation)  
- Session-based workflow with multiple question loops  
- Automatic timestamping per question  
- Dynamic hexagram generation from user input  
- SVG-based hexagram line rendering  
- Consultant-entered interpretations via text input  
- Aggregated report preview before export  
- A5-formatted PDF generation  
- Direct PDF sharing or saving  
- Clean exit with session reset  

---

## What the App Does Not Do

- No automated interpretations  
- No predefined consultant commentary  
- No backend, APIs, or cloud storage  
- No analytics or tracking  
- No client data persistence beyond the active session  

All interpretive content remains the consultant’s intellectual property.

---

## Tech Stack

- Flutter  
- Dart  
- Material UI  
- SVG rendering (`flutter_svg`)  
- Date & time formatting (`intl`)  
- PDF generation (`pdf`)  
- PDF sharing / printing (`printing`)  

---

## Architecture Notes

- Session state is maintained during runtime  
- Each question entry:
  - Captures system date and time  
  - Stores category and hexagram data  
  - Stores consultant-entered interpretation text  
- The question loop continues until the consultant ends the session  
- Report generation compiles all session questions into a single document  
- PDF output is formatted specifically for A5 paper size  

---

## Platform Support

- Android (APK)
- Tested on emulator and physical devices

---

## Build Instructions

```bash
flutter pub get
flutter build apk --release
```

---

## APK Output

The release APK is generated at:

`build/app/outputs/flutter-apk/app-release.apk`

---

## Project Status

Completed / Stable

This repository represents a finalized implementation.  
Client-specific branding, contact details, and proprietary content are intentionally excluded.

---

## License

Private / Client Work  
Not intended for redistribution.
