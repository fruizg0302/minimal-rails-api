# Base image, make sure that the Ruby version is compatible with the version in your Gemfile.
FROM ruby:3.1.1
MAINTAINER fernando ruiz <fernando.ruiz@hey.com>
# Install dependencies needed for the app and delete the packages after installed.
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends

# Create a directory inside the container for the project.
WORKDIR /docker-rails

# Set the folder to where install ruby gems
ENV BUNDLE_PATH /gems
COPY Gemfile Gemfile.lock /docker-rails/
RUN bundle install

# Copy source code after dependencies installed
COPY . /docker-rails/

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

# Expose the port that rails uses
EXPOSE 3000