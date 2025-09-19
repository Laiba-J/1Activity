# Use nginx image to serve static files
FROM nginx:stable-alpine

# Copy your local files (index.html, css, js, etc.) into nginx default html folder
COPY . /usr/share/nginx/html

# Expose port 80 for web access
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
