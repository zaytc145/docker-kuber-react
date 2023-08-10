FROM node:16-alpine as builder
LABEL authors="Zayts"

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

ENTRYPOINT ["top", "-b"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html