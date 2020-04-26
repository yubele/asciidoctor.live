# Define base image, you can use --build-arg
ARG base_image="newsdict/rails:ubuntu19.10_nvmv0.35.2_nodev13.9.0_rubyv2.7.0_sasscv2.3.0_ffiv1.12.2"
FROM $base_image

# Set locale
ENV LANG "C.UTF-8"
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES "YES"

# Set correct environment variables.
RUN mkdir -p /var/www/docker
WORKDIR /var/www/docker

# Set up application
COPY . .
RUN cp src/provisioning/nginx/sites-available/default /etc/nginx/sites-available/default
RUN cp -r src/provisioning/startup /startup

# Init gems
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc
RUN . /etc/profile.d/rvm.sh && \
  bundle config --global system true && \
  bundle install --quiet

CMD ["bash", "/startup/asciidoctor/startup.sh", "production"]

EXPOSE 80 3001