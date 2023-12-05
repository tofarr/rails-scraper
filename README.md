# README

## Action Log:

rails new scraper

rails generate model UrlInfo url:string:uniq title:string description:text thumbnail_url:string

Added not null for Url

Added url validator

rails db:migrate 

rails generate controller Scraper

added scraper and view

bundle add nokogiri

added load_meta method to url_info
