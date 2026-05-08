FROM ruby:3.3-slim AS builder
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*
COPY Gemfile ./
RUN bundle install --jobs 4

FROM ruby:3.3-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
      libpq5 && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY Gemfile Rakefile config.ru app.rb ./
COPY db/ db/
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:3000"]
