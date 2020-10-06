# Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# next will create /app/build
RUN npm run build

# Nginx Phase
FROM nginx
# Port map
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html