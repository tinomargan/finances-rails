# syntax=docker/dockerfile:1

FROM ruby:3.4.1-slim AS base

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Install Yarn
RUN npm install -g yarn

WORKDIR /app

# Copy Gemfiles first to leverage Docker cache
COPY Gemfile ./

# Install gems inside container
RUN bundle config set --local without 'development test' && \
    bundle install

# Copy the rest of the app
COPY . .

EXPOSE 3000

# Start Rails
CMD ["bash", "-c", "bundle exec rails db:prepare && bundle exec rails s -b 0.0.0.0 -p 3000"]
