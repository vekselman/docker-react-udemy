# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# next will create /app/build
RUN npm run build

# Nginx Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html