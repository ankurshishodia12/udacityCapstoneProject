FROM nginx:1.12-alpine

# Copy source code to working directory
COPY index.html /usr/share/nginx/html
COPY css/App.css /usr/share/nginx/html
COPY js/App.js /usr/share/nginx/html

# Expose port 80
EXPOSE 80