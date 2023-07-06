FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json package-lock.json ./
RUN npm install

COPY . .

CMD ["npm", "run", "build"]

FROM nginx:alpine as run
WORKDIR '/app'

COPY --from=builder /app/build /usr/share/nginx/html


