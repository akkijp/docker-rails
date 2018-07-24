# environment-rails
docker hub: https://hub.docker.com/r/rorono/rails/
quay.io: https://quay.io/repository/rorono/rails

## Example Usage

### production
```Dockerfile
FROM rorono/rails:ruby-2.5.0-node-8.11.3

# ==============================
# install app
# ==============================

# rails env
ENV RAILS_ENV=production

RUN mkdir /app
WORKDIR /app

# bundle install
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test --path vendor/bundle --frozen

# yarn install
COPY package.json yarn.lock .postcssrc.yml ./
RUN yarn install

# assets precompile
COPY .babelrc ./
COPY Rakefile ./
COPY config config
COPY app app
COPY bin bin

ADD . /app

ENV RAILS_SERVE_STATIC_FILES=true

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
```


### development
```Dockerfile
FROM rorono/rails:ruby-2.5.0-node-8.11.3

# ==============================
# install app
# ==============================

# rails env
ENV RAILS_ENV=development

RUN mkdir /app
WORKDIR /app

# bundle install
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
#RUN bundle install --path vendor/bundle --frozen

# yarn install
COPY package.json yarn.lock .postcssrc.yml ./
#RUN yarn install

# assets precompile
COPY .babelrc ./
COPY Rakefile ./
COPY config config
COPY app app
COPY bin bin

ADD . /app

#ENV RAILS_SERVE_STATIC_FILES=true

ENTRYPOINT ["./docker-entrypoint.dev.sh"]
CMD ["bundle", "exec", "foreman", "start", "-f", "Procfile.dev"]
```
