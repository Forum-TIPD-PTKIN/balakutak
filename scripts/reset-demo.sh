#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="/home/apps/app-cms"
LOG_FILE="/var/log/cms-demo-reset.log"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Memulai reset demo Balakutak CMS ===" >> "${LOG_FILE}"

# 1. Pastikan kontainer cms_db berjalan
if ! docker ps --format '{{.Names}}' | grep -q "^cms_db$"; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Menyalakan container cms_db..." >> "${LOG_FILE}"
    cd "${PROJECT_DIR}" && docker compose up -d cms_db
    sleep 5
fi

# 2. Restore database
if [ -f "${PROJECT_DIR}/demo-pristine.sql" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Memulihkan database balakutak_cms..." >> "${LOG_FILE}"
    docker exec -i cms_db mariadb -u cms_user -pcms_password_secure_2026 balakutak_cms < "${PROJECT_DIR}/demo-pristine.sql"
fi

# 3. Restore storage publik
if [ -f "${PROJECT_DIR}/demo-storage-pristine.tar.gz" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Memulihkan berkas storage publik..." >> "${LOG_FILE}"
    rm -rf "${PROJECT_DIR}/storage/app/public"
    tar -xzf "${PROJECT_DIR}/demo-storage-pristine.tar.gz" -C "${PROJECT_DIR}/storage/app"
    docker exec cms_app chown -R www-data:www-data /var/www/html/storage 2>/dev/null || true
fi

# 4. Clear cache Laravel
docker exec cms_app php artisan optimize:clear >> "${LOG_FILE}" 2>&1 || true

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Reset demo Balakutak CMS selesai." >> "${LOG_FILE}"
