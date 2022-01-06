# ---------------------------------------
# ------- Stage: build ------------------
# ---------------------------------------
FROM node:16.13-alpine as development
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm run test:cov
# ---------------------------------------
# ------- Stage: run --------------------
# ---------------------------------------
FROM node:16.13-alpine as production
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
EXPOSE 3000
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production --ignore-scripts
COPY --from=development /usr/src/app/dist ./dist
CMD ["node", "dist/main"]

