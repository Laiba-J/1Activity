# Stage 1 - Serve Stage (build context or placeholder)
# Here we just copy the source files (if it was React, this is where we'd run npm run build)
FROM node:18-alpine AS serve
WORKDIR /app

# Copy everything (for React you'd copy package.json and run npm install)
COPY . .

# In a React app, you'd run: RUN npm run build
# For a static HTML, this stage just passes files to production

# Stage 2 - Production Stage (nginx to serve static files)
FROM nginx:stable-alpine AS production

# Copy files from the previous stage into nginx html folder
COPY --from=serve /app /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
