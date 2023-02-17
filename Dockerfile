FROM node:14.7.0
WORKDIR /app
COPY ./calculator .
RUN npm install
RUN npm run build
CMD ["npm", "start"]