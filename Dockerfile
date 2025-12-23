FROM node:20-alpine

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
  CMD nc -z 127.0.0.1 51304 || exit 1

CMD ["node", "server.js"]