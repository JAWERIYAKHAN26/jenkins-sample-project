# Step 1: Base image
FROM nginx:alpine

# Step 2: Copy your project files into the Nginx container
COPY . /usr/share/nginx/html

# Step 3: Expose port 80 for web access
EXPOSE 80

