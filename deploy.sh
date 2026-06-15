#!/bin/bash
set -e

ENV_FILE="$(dirname "$0")/.env"
if [ ! -f "$ENV_FILE" ]; then
  echo "❌ .env file not found at $ENV_FILE"
  exit 1
fi

source "$ENV_FILE"

echo "🚀 Deploying to IONOS..."

/opt/homebrew/bin/lftp -e "
  set sftp:auto-confirm yes
  set net:max-retries 3
  open sftp://$SFTP_USER:$SFTP_PASS@$SFTP_HOST:$SFTP_PORT
  mirror --reverse --delete --verbose --no-perms \
    --exclude ^\.git/ \
    --exclude ^\.env \
    --exclude ^\.gitignore \
    --exclude ^deploy\.sh \
    --exclude ^README\.md \
    --exclude ^\.DS_Store \
    . $SFTP_PATH
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
  bye
" 2>&1

echo "✅ Deploy complete! Visit https://claudev1.albertsaavedra.com"
