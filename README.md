# docker-rails [![Build Status](https://travis-ci.org/rorono/docker-rails.svg?branch=master)](https://travis-ci.org/rorono/docker-rails)
- docker hub: https://hub.docker.com/r/rorono/rails/
- quay.io: https://quay.io/repository/rorono/rails

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

## License

MIT License

Copyright (c) 2018 - 2020 Kosuke Akizuki

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
