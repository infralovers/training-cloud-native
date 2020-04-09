FROM node:10.16.3-slim

ENV NODE_ENV=production

# Change workin directory
WORKDIR /app

# Copy source code
COPY . /app

# Install dependencies
RUN npm install

# Set service directory
ENV SERVICEDIR=services

# Expose API Port to the outside
ENV PORT 3000
EXPOSE 3000

# Launch application
CMD ["npm", "start"]
