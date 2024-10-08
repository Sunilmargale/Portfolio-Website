# Stage 1: Build the React app --> final Dockerfile
#FROM node:alpine AS build
#WORKDIR /app

# Copy only package.json and package-lock.json
#COPY package*.json ./

# Install only production dependencies
#RUN npm ci --production

# Copy the rest of the application code
#COPY . .

# Build the app
#RUN npm run build

# Stage 2: Serve the app with Nginx
#FROM nginx:alpine
#RUN rm -rf /usr/share/nginx/html/*

# Copy the built React app from the previous stage
#COPY --from=build /app/build /usr/share/nginx/html

# stage 01 it is a first step to resuce docker image size
FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "start"]


# stage 01 it is a first step to resuce docker image size

#FROM node:alpine AS Build
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN npm run build


#FROM node:alpine AS production
#WORKDIR /app
#COPY --from=build /app/build /app/build
#RUN npm install -g serve
#EXPOSE 3000
#CMD ["serve", "-s", "build", "-l", "3000"]
