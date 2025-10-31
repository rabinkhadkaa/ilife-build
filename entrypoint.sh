#!/bin/bash
set -e

echo "Starting Base image container as $(whoami)"

# Ensure Apache runtime directories exist
mkdir -p /var/run/apache2
chown -R root:root /var/run/apache2

# Start PHP-FPM in background
if command -v php-fpm >/dev/null 2>&1; then
    echo "Starting PHP-FPM..."
    php-fpm -D
else
    echo "ERROR: PHP-FPM not found!"
    exit 1
fi

# Start Apache in foreground
echo "Starting Apache..."
exec apachectl -D FOREGROUND
