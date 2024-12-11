# Use the latest NGINX image as the base
FROM nginx:latest

# Copy the HTML and CSS files into the appropriate directory in the container
COPY index.html /usr/share/nginx/html
COPY style.css /usr/share/nginx/html

# Expose port 80
EXPOSE 80

