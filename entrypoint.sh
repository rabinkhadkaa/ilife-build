#!/bin/bash
echo "Base image entrypoint as $(whoami)"

# Start PHP-FPM
exec php-fpm
