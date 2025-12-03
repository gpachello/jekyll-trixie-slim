FROM debian:trixie-slim

# Crear un usuario rootless
RUN useradd -m -u 1000 jekyll

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ruby-full \
        build-essential \
        git \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instalar herramientas Ruby
RUN gem install bundler

# Directorio del sitio y de las gems
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
