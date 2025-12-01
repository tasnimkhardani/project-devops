#!/bin/bash
# simple smoke test: vérifie que l'endpoint /health retourne 200
set -e
ENDPOINT=${1:-http://localhost:3000/health}
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $ENDPOINT || true)
if [ "$STATUS" == "200" ]; then
echo "SMOKE: PASSED"
exit 0
else
echo "SMOKE: FAILED (HTTP $STATUS)"
exit 1
fi
