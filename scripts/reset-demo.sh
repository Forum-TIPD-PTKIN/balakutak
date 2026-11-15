#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="/home/apps/app-cms"
LOG_FILE="/var/log/cms-demo-reset.log"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Memulai reset demo Balakutak CMS via DemoManager Module ===" >> "${LOG_FILE}"

# Pastikan container berjalan
if ! docker ps --format '{{.Names}}' | grep -q "^cms_app$"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Menyalakan container CMS..." >> "${LOG_FILE}"
    cd "${PROJECT_DIR}" && docker compose up -d
    sleep 5
fi

# Eksekusi command modular native Laravel demo:reset
docker exec cms_app php artisan demo:reset --force >> "${LOG_FILE}" 2>&1

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Reset demo Balakutak CMS selesai." >> "${LOG_FILE}"
