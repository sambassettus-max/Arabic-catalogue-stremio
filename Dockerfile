FROM node:20-slim
RUN apt-get update && apt-get install -y wget gnupg && wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt-get install -y /tmp/chrome.deb && rm /tmp/chrome.deb && rm -rf /var/lib/apt/lists/*
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome
WORKDIR /app
COPY package*.json ./
RUN npm install --no-audit --no-fund
COPY . .
EXPOSE 7000
CMD ["npm", "start"]

