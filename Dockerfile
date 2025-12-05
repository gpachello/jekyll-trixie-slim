FROM debian:trixie-slim

RUN useradd -m -u 1000 jekyll

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ruby-full build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler --no-document && \
    gem install jekyll --no-document

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
