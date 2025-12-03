FROM debian:trixie-slim

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ruby-full \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create rootless user
RUN useradd -m -u 1000 jekyll

# Install Ruby Gems
RUN gem install --no-document jekyll bundler

# Environment
ENV GEM_HOME=/gems
ENV BUNDLE_PATH=/gems
ENV BUNDLE_APP_CONFIG=/gems

RUN mkdir -p /site /gems && chown -R jekyll:jekyll /site /gems
WORKDIR /site

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER jekyll

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--livereload", "--host", "0.0.0.0"]
