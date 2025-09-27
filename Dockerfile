# Use official PHP image with CLI and Alpine for smaller size
FROM php:8.4-cli-alpine

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY src/ .

# Expose port 80
EXPOSE 8000

# Start PHP's built-in web server
CMD ["php", "-S", "0.0.0.0:8000"]