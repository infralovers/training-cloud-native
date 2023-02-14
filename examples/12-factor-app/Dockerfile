FROM node:19.6.0

ENV NODE_ENV=production

# Change workin directory
WORKDIR /app

# Copy source code
COPY . .

# Install dependencies
RUN npm install

# Set service directory
ENV SERVICEDIR=services

# Expose API Port to the outside
ENV PORT 3000
EXPOSE 3000

VOLUME ["/app/data/"]
# Launch application
CMD ["npm", "start"]
