# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the webpage files into the Nginx container
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

# Expose the port the app will run on
EXPOSE 80

# Start Nginx to serve the app
CMD ["nginx", "-g", "daemon off;"]


