# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Log:

rails new scraper

rails generate model UrlInfo url:string:uniq title:string description:text thumbnail_url:string

Added not null for Url

Added url validator

rails db:migrate 

rails generate controller Scraper

added scraper and view

bundle add nokogiri

added load_meta method to url_info
