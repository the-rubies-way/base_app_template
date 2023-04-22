file ".github/workflows/ci.yml", <<~YAML
name: CI
on:
  push:
jobs:
  build:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432
    env:
      #{app_name.upcase}_DATABASE_USERNAME: postgres
      #{app_name.upcase}_DATABASE_PASSWORD: postgres
      RAILS_ENV: test
    steps:
      - uses: actions/checkout@v2
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: #{RUBY_VERSION}
          bundler-cache: true
          cache-version: 1
      - name: Install PostgreSQL client
        run: |
          sudo apt-get -yqq install libpq-dev
      - name: Build App
        run: |
          cp config/database.yml.example config/database.yml
          bundle exec rake db:create
          bundle exec rake db:migrate
      - name: Run rspec
        run: bundle exec rspec
YAML
