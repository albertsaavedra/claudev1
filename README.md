# claudev1 — Albert Saavedra Personal Site

Personal portfolio and CV site. Live at [claudev1.albertsaavedra.com](https://claudev1.albertsaavedra.com).

## Stack

Static HTML + CSS + vanilla JS. No frameworks, no build step, no dependencies.

## Structure

```
claudev1/
├── index.html    # Main page (EN/ES toggle)
├── style.css     # All styles
├── lang.js       # Language switcher
├── deploy.sh     # Deploy to IONOS via SFTP (requires .env)
└── assets/
    └── img/      # Images
```

## Local development

Open `index.html` directly in a browser — no server needed.

## Deploy to IONOS

Credentials go in a `.env` file (never committed):

```
SFTP_HOST=...
SFTP_PORT=22
SFTP_USER=...
SFTP_PASS=...
SFTP_PATH=/
```

Then run:

```bash
bash deploy.sh
```

## Git workflow

```bash
# Before starting any work
git checkout main && git pull

# Create a branch
git checkout -b my-change

# Save and push
git add .
git commit -m "Description of change"
git push origin my-change

# Open a Pull Request on GitHub, review, merge
```
