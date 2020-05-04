# Build phase

# tag the phase as builder
FROM node:alpine as builder

WORKDIR '/app'
COPY . .
RUN npm install
RUN npm run build

# Run Phase
FROM nginx
# copy build folder from builder stage
COPY --from=builder /app/build /usr/share/nginx/html
