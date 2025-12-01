#!/bin/bash
# vérifie que la page d'accueil rend quelque chose
set -e
ENDPOINT=${1:-http://localhost:3001}
HTTP=$(curl -s -o /dev/null -w "%{http_code}" $ENDPOINT || true)
if [ "$HTTP" == "200" ]; then
echo "SMOKE: PASSED"
exit 0
else
echo "SMOKE: FAILED (HTTP $HTTP)"
exit 1
fi
